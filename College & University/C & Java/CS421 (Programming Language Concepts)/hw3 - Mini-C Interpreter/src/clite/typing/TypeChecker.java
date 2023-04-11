package clite.typing;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import clite.ast.Assignment;
import clite.ast.Binary;
import clite.ast.Block;
import clite.ast.Conditional;
import clite.ast.Declaration;
import clite.ast.Declarations;
import clite.ast.Expression;
import clite.ast.Loop;
import clite.ast.Operator;
import clite.ast.Program;
import clite.ast.Skip;
import clite.ast.Statement;
import clite.ast.Type;
import clite.ast.Unary;
import clite.ast.Value;
import clite.ast.Variable;
import clite.parser.Lexer;
import clite.parser.Parser;

/**
 * <b>File Name:    </b>    TypeChecker.java                <br>
 * <b>Project Name: </b>    hw3 (MINI-C Interpreter)        <br>
 * <b>Class:        </b>    CS421 (Spring)                  <br>
 * <b>Date Modified:</b>    4/4/2022                        <br><br>
 * 
 * Type checks a given MINI-C file. Example file: "example-mini.c".   <br>
 * The first argument given to this program must be a MINI-C file.    <br>
 * 
 * @author Kong Jimmy Vang
 */
public class TypeChecker {
    
    /** Line Counter (For debugging purposes) */
    protected static int lineCounter = 2;
    
    /** A Set that will contain Reserved Words that are reserved by the MINI-C Interpreter. */
    protected static HashSet<String> reservedWords;
    
    /**
     * Type checks a given MINI-C Program p for type correctness.
     * 
     * @param p - MINI-C Program.
     * @return Returns true if and only if the MINI-C Program p is valid. Otherwise false.
     */
    public static boolean isValid(Program p) {
        initializeReservedWords();
        boolean bIsValid = true;
        
        // Type Map of main().
        TypeMap tm = new TypeMap();
        
        Declarations decs = p.getDecpart();
        bIsValid = checkDeclarations(decs, tm) ? bIsValid : false;
        
        Block block = p.getBody();
        bIsValid = checkBlock(block, tm) ? bIsValid : false;

        return bIsValid;
    } 
    
    /**
     * Validates an Expression.
     * @param e - Expression
     * @param tm - TypeMap
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateExpression(Expression e, TypeMap tm) {
        
        if (e instanceof Variable) {
            return validateVariable(e, tm);
        } else if (e instanceof Value) {
            return validateValue(e, tm);
        } else if (e instanceof Binary) {
            Binary b = (Binary) e;
            Operator op = b.getOp();
            
            if (op.ArithmeticOp()) {
                return validateArithmetic(e, tm, b, op);
            } else if (op.BooleanOp()) {
                return validateBoolean(e, tm, b, op);
            } else if (op.RelationalOp()) {
                return validateRelational(e, tm, b, op);
            } else {
                System.err.println(
                        String.format("ERROR (Line %d): Unhandled case detected "
                                + "for binary operation: %s", lineCounter, op));
                return false;
            }
            
        } else if (e instanceof Unary) {
            return validateUnary(e, tm);
        }
        
        System.err.println(String.format("ERROR (Line %d): Expression is invalid: ", lineCounter, e));
        return false;
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Variable expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateVariable(Expression e, TypeMap tm) {
        boolean bIsValid = true;
        Type typeE = typeOf(e, tm);
        
        if (e instanceof Variable) {
            bIsValid = checkReserved((Variable) e);
        }
        
        if (null == typeE) {
            System.err.println(String.format("ERROR (Line %d): Variable '%s' has not been declared.", lineCounter, e));
            return false;
        } else {
            return bIsValid;
        }
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Value expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateValue(Expression e, TypeMap tm) {
        Value<?> v = (Value<?>) e;
        Type typeE = typeOf(e, tm);
        
        if (Type.INT.equals(typeE) || Type.BOOL.equals(typeE)) {
            return true;
        } else {
            System.err.println(
                    String.format("ERROR (Line %d): Type of value %s is not a valid type. (TYPE=%s)", lineCounter, v, typeE));
            return false;
        }
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Binary Arithmetic expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @param b - Binary Expression
     * @param op - Operator
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateArithmetic(Expression e, TypeMap tm, Binary b, Operator op) {
        boolean bIsValid = true;
        
        bIsValid = validateExpression(b.getTerm1(), tm) ? bIsValid : false;
        bIsValid = validateExpression(b.getTerm2(), tm) ? bIsValid : false;
        Type type1 = typeOf(b.getTerm1(), tm);
        Type type2 = typeOf(b.getTerm2(), tm);
        if (null != type1 && Type.INT.equals(type1)) {
            if (Type.INT.equals(type2)) {
                if (!type1.equals(type2)) {
                    bIsValid = false;
                    System.err.println(
                            String.format("ERROR (Line %d): Term '%s' and Term '%s' are not of same types. "
                                    + "(%s=%s, %s=%s) For arithmetic op: %s", 
                                    lineCounter, b.getTerm1(), b.getTerm2(), 
                                    b.getTerm1(), type1, b.getTerm2(), type2, op));
                }
            } else {
                bIsValid = false;
                System.err.println(
                        String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                                + "It must type INT for the arithmetic op: %s", 
                                lineCounter, b.getTerm2(), type2, op));
            }
        } else {
            bIsValid = false;
            System.err.println(
                    String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                            + "It must type INT for the arithmetic op: %s", 
                            lineCounter, b.getTerm1(), type1, op));
        }
        return bIsValid;
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Binary Boolean expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @param b - Binary Expression
     * @param op - Operator
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateBoolean(Expression e, TypeMap tm, Binary b, Operator op) {
        boolean bIsValid = true;
        
        bIsValid = validateExpression(b.getTerm1(), tm) ? bIsValid : false;
        bIsValid = validateExpression(b.getTerm2(), tm) ? bIsValid : false;
        Type type1 = typeOf(b.getTerm1(), tm);
        Type type2 = typeOf(b.getTerm2(), tm);
        if (null != type1 && Type.BOOL.equals(type1)) {
            if (null != type2 && Type.BOOL.equals(type2)) {
                if (!type1.equals(type2)) {
                    bIsValid = false;
                    System.err.println(
                            String.format("ERROR (Line %d): Term '%s' and Term '%s' are not of same types. "
                                    + "(%s=%s, %s=%s) For boolean op: %s", 
                                    lineCounter, b.getTerm1(), b.getTerm2(), 
                                    b.getTerm1(), type1, b.getTerm2(), type2, op));
                }
            } else {
                bIsValid = false;
                System.err.println(
                        String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                                + "It must type BOOL for the boolean op: %s", 
                                lineCounter, b.getTerm2(), type2, op));
            }
        } else {
            bIsValid = false;
            System.err.println(
                    String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                            + "It must type BOOL for the boolean op: %s", 
                            lineCounter, b.getTerm1(), type1, op));
        }
        return bIsValid;
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Binary Relational expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @param b - Binary Expression
     * @param op - Operator
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateRelational(Expression e, TypeMap tm, Binary b, Operator op) {
        boolean bIsValid = true;
        
        bIsValid = validateExpression(b.getTerm1(), tm) ? bIsValid : false;
        bIsValid = validateExpression(b.getTerm2(), tm) ? bIsValid : false;
        Type type1 = typeOf(b.getTerm1(), tm);
        Type type2 = typeOf(b.getTerm2(), tm);
        
        if (null != type1 && Type.BOOL.equals(type1)) {
            if (Operator.EQ.equals(op.val) || Operator.NE.equals(op.val)) {
                if (!type1.equals(type2)) {
                    bIsValid = false;
                    System.err.println(
                            String.format("ERROR (Line %d): Term '%s' and Term '%s' are not of same types. "
                                    + "(%s=%s, %s=%s) For relational op: %s", 
                                    lineCounter, b.getTerm1(), b.getTerm2(), 
                                    b.getTerm1(), type1, b.getTerm2(), type2, op));
                }
            } else {
                bIsValid = false;
                System.err.println(
                        String.format("ERROR (Line %d): Term '%s' is of type %s "
                                + "and is not operable on the relational op: %s", 
                                lineCounter, b.getTerm1(), type1, op));
            }
        } else if (null != type1 && Type.INT.equals(type1)) {
            if (Operator.LT.equals(op.val)
                    || Operator.LE.equals(op.val) 
                    || Operator.EQ.equals(op.val)
                    || Operator.NE.equals(op.val)
                    || Operator.GT.equals(op.val)
                    || Operator.GE.equals(op.val)) {
                if (!type1.equals(type2)) {
                    bIsValid = false;
                    System.err.println(
                            String.format("ERROR (Line %d): Term '%s' and Term '%s' are not of same types. "
                                    + "(%s=%s, %s=%s) For relational op: %s", 
                                    lineCounter, b.getTerm1(), b.getTerm2(), 
                                    b.getTerm1(), type1, b.getTerm2(), type2, op));
                }
            } else {
                bIsValid = false;
                System.err.println(
                        String.format("ERROR (Line %d): Term '%s' is of type %s "
                                + "and is not operable on the relational op: %s", 
                                lineCounter, b.getTerm1(), type1, op));
            }
        } else {
            bIsValid = false;
            System.err.println(
                    String.format("ERROR (Line %d): The Binary expression '%s' and their terms \r\n\t"
                            + "both must be of type INT or BOOL for the relational op: %s "
                            + "(%s=%s, %s=%s)", 
                            lineCounter, b, op, b.getTerm1(), type1, b.getTerm2(), type2));
        }
        return bIsValid;
    }
    
    /**
     * (Helper Method for 'validateExpression')
     * Validates a Unary expression.
     * 
     * @param e - Expression
     * @param tm - TypeMap
     * @return Returns true if the Expression e is valid. Otherwise false.
     */
    public static boolean validateUnary(Expression e, TypeMap tm) {
        
        boolean bIsValid = true;
        Unary u = (Unary) e;
        Operator op = u.getOp();
        
        if (op.NegateOp()) {
            //System.out.println("NegateOp");
            bIsValid = validateExpression(u.getTerm(), tm) ? bIsValid : false;
            Type type = typeOf(u.getTerm(), tm);
            if (null != type && !Type.INT.equals(type)) {
                System.err.println(
                        String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                                + "The Term must be of type INT.", lineCounter, u.getTerm(), type));
                bIsValid = false;
            }
            return bIsValid;
        } else if (op.NotOp()) {
            //System.out.println("NotOp");
            bIsValid = validateExpression(u.getTerm(), tm) ? bIsValid : false;
            Type type = typeOf(u.getTerm(), tm);
            if (null != type && !Type.BOOL.equals(type)) {
                System.err.println(
                        String.format("ERROR (Line %d): The Term '%s' is of type %s. "
                                + "The Term must be of type BOOL.", lineCounter, u.getTerm(), type));
                bIsValid = false;
            }
            return bIsValid;
        } else {
            System.err.println(
                    String.format("ERROR (Line %d): Unhandled case detected "
                            + "for unary operation: %s", lineCounter, op));
            return false;
        }
    }
    
    /**
     * Gets the type of a given Expression e.
     * @param e - Expression
     * @param tm - TypeMap
     * @return Returns the Type of the expression E.
     */
    public static Type typeOf(Expression e, TypeMap tm) {
        if (e instanceof Variable) {
            return tm.get(e);
        } else if (e instanceof Value) {
            Value<?> v = (Value<?>) e;
            return v.typeOf();
        } else if (e instanceof Binary) {
            Binary b = (Binary) e;
            Operator op = b.getOp();
            
            if (op.ArithmeticOp()) {
                return Type.INT;
            } else if (op.BooleanOp()) {
                return Type.BOOL;
            } else if (op.RelationalOp()) {
                return Type.BOOL;
            } else {
                return null;
            }
            
        } else if (e instanceof Unary) {
            Unary u = (Unary) e;
            Operator op = u.getOp();
            
            if (op.NegateOp()) {
                return Type.INT;
            } else if (op.NotOp()) {
                return Type.BOOL;
            } else {
                return null;
            }
        }
        
        return null;
    }
    
    /**
     * Validates Declarations.
     * @param decs - Declarations
     * @param tm - TypeMap
     * @return Returns true if declarations are valid. Otherwise false.
     */
    public static boolean checkDeclarations(Declarations decs, TypeMap tm) {
        boolean bIsValid = true;
        
        for (Declaration dec : decs) {
            
            if (tm.containsKey(dec.getV())) {
                System.err.println(
                        String.format("ERROR (Line %d): "
                                + "Duplicate identifier declared: '%s'.", lineCounter, dec.getV()));
                bIsValid = false;
            }
            
            if (!checkReserved(dec.getV())) {
                bIsValid = false;
            }
            
            tm.put(dec.getV(), dec.getT());
            lineCounter++;
        }
        return bIsValid;
    }
    
    /**
     * Validates a given Block.
     * @param block - Block
     * @param tm - TypeMap
     * @return Returns true if the given block contains valid declarations and statements. Otherwise false.
     */
    public static boolean checkBlock(Block block, TypeMap tm) {
        
        TypeMap ltm = new TypeMap();
        
        boolean bIsValid = true;
        lineCounter++;
        
        bIsValid = checkDeclarations(block.getDeclarations(), ltm) ? bIsValid : false;
        ltm.putAll(tm);
        bIsValid = checkStatements(block.getStatements(), ltm) ? bIsValid : false;
        
        return bIsValid;
    }
    
    /**
     * Validates a given list of Statements.
     * @param statements - List of Statements
     * @param tm - TypeMap
     * @return Returns true if all statements are valid. Otherwise false.
     */
    public static boolean checkStatements(List<Statement> statements, TypeMap ltm) {
        boolean bIsValid = true;
        
        for (Statement statement : statements) {
            if (statement instanceof Skip) {
                // Do Skip;
                
            } else if (statement instanceof Assignment) {
                Assignment assignment = (Assignment) statement;
                Variable v = assignment.getTarget();
                Expression e = assignment.getSource();
                
                bIsValid = validateVariable((Expression) v, ltm) ? bIsValid : false;
                
                Type typeV = ltm.get(v);
                Type typeE = typeOf(e, ltm);
                bIsValid = validateExpression(e, ltm) ? bIsValid : false;
                
                if (null != typeV) {
                    if (!typeV.equals(typeE)) {
                        System.err.println(
                                String.format("ERROR (Line %d): Variable '%s' (%s) "
                                        + "is not of same type of Expression '%s' (%s)", 
                                        lineCounter, v, typeV, e, typeE));
                        bIsValid = false;
                    }
                }
                
                //System.out.println(v + " = " + e + "   (" + typeV + "=" + typeE + ")");
            } else if (statement instanceof Block) {
                Block block = (Block) statement;
                bIsValid = checkBlock(block, ltm) ? bIsValid : false;
                lineCounter--;
                
            } else if (statement instanceof Conditional) {
                Conditional cond = (Conditional) statement;
                
                Expression testExpr = cond.getTest();
                Statement thenStmt = cond.getThenbranch();
                Statement elseStmt = cond.getElsebranch();
                
                bIsValid = validateExpression(testExpr, ltm) ? bIsValid : false;
                
                Type typeE = typeOf(testExpr, ltm);
                if (!Type.BOOL.equals(typeE)) {
                    System.err.println(
                            String.format("ERROR (Line %d): "
                                    + "The test expression '%s' of the following IF statement is not a BOOL.", lineCounter, testExpr));
                    bIsValid = false;
                }
                
                List<Statement> stmts1 = new ArrayList<>();
                List<Statement> stmts2 = new ArrayList<>();
                stmts1.add(thenStmt);
                stmts2.add(elseStmt);
                
                TypeMap ltm2 = new TypeMap(ltm);
                TypeMap ltm3 = new TypeMap(ltm);
                bIsValid = checkStatements(stmts1, ltm2) ? bIsValid : false;
                bIsValid = checkStatements(stmts2, ltm3) ? bIsValid : false;
                
            } else if (statement instanceof Loop) {
                Loop loop = (Loop) statement;
                
                Expression testExpr = loop.getTest();
                Statement bodyStmt = loop.getBody();
                
                Type typeE = typeOf(testExpr, ltm);
                if (!Type.BOOL.equals(typeE)) {
                    System.err.println(
                            String.format("ERROR (Line %d): "
                                    + "The test expression '%s' of the following WHILE loop is not a BOOL.", lineCounter, testExpr));
                    bIsValid = false;
                }
                
                bIsValid = validateExpression(testExpr, ltm) ? bIsValid : false;
                
                List<Statement> stmts = new ArrayList<>();
                stmts.add(bodyStmt);
                
                TypeMap ltm2 = new TypeMap(ltm);
                bIsValid = checkStatements(stmts, ltm2) ? bIsValid : false;
            } else {
                System.err.println(
                        String.format("ERROR (Line %d): "
                                + "Statement type could not be identified for statement: %s", lineCounter, statement));
                bIsValid = false;
            }
            lineCounter++;
        }
        
        return bIsValid;
    }
    
    /**
     * Validates a given Variable var against a reserved wordlist.
     * @param var - Variable
     * @return Returns false if the Variable var is contained in the reserved list. Otherwise true.
     */
    public static boolean checkReserved(Variable var) {
        if (reservedWords.contains(var.toString())) {
            System.err.println(
                    String.format("ERROR (Line %d): "
                            + "The identifier '%s' is a reserved word.", lineCounter, var));
            return false;
        }
        return true;
    }
    
    /**
     * Populates the reserved words set.
     */
    public static void initializeReservedWords() {
        reservedWords = new HashSet<>();
        reservedWords.add("auto");
        reservedWords.add("_Packed");
        reservedWords.add("enum");
        reservedWords.add("register");
        reservedWords.add("typedef");
        reservedWords.add("extern");
        reservedWords.add("union");
        reservedWords.add("void");
        reservedWords.add("return");
        reservedWords.add("sizeof");
        reservedWords.add("volatile");
        reservedWords.add("switch");
        reservedWords.add("case");
        reservedWords.add("default");
        reservedWords.add("if");
        reservedWords.add("else");
        reservedWords.add("static");
        reservedWords.add("while");
        reservedWords.add("do");
        reservedWords.add("for");
        reservedWords.add("break");
        reservedWords.add("continue");
        reservedWords.add("goto");
        reservedWords.add("struct");
        reservedWords.add("const");
        reservedWords.add("unsigned");
        reservedWords.add("signed");
        reservedWords.add("char");
        reservedWords.add("short");
        reservedWords.add("int");
        reservedWords.add("long");
        reservedWords.add("float");
        reservedWords.add("double");
    }
    
    /**
     * The first argument given to this Type Checker must be a MINI-C file.
     * @param args - First argument must be a MINI-C file.
     */
    public static void main(String args[]) {    
        Parser parser  = new Parser(new Lexer(args[0]) );
        Program prog = parser.program();
        System.out.println(isValid( prog ) );
    }
} 
