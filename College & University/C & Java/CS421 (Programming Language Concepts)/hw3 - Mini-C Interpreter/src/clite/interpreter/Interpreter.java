package clite.interpreter;

import java.util.ArrayList;
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
import clite.ast.Unary;
import clite.ast.Value;
import clite.ast.Variable;
import clite.parser.Lexer;
import clite.parser.Parser;
import clite.typing.TypeChecker;

/**
 * <b>File Name:    </b>    Interpreter.java                <br>
 * <b>Project Name: </b>    hw3 (MINI-C Interpreter)        <br>
 * <b>Class:        </b>    CS421 (Spring)                  <br>
 * <b>Date Modified:</b>    4/4/2022                        <br><br>
 * 
 * Interprets the meaning of a given MINI-C file. Example file: "example-mini.c".   <br>
 * The first argument given to this program must be a MINI-C file.                  <br>
 * 
 * @author Kong Jimmy Vang
 */
public class Interpreter {

    /**
     * Interprets the meaning of a given Program.
     * @param program - Given Program
     * @return Returns the final State of the given program.
     */
    public static State meaning( Program program ) {
        State state = new State();
        
        Declarations decs = program.getDecpart();
        state = interpretDeclarations(decs, state);
        
        Block block = program.getBody();
        state = interpretBlock(block, state);
        
        return state;
    }
    
    /**
     * Interpret the meaning of given Declarations.
     * @param decs - Given Declarations.
     * @param s - Current Scope State.
     * @return Returns the updated State s, resulting from interpretation.
     */
    public static State interpretDeclarations(Declarations decs, State s) {
        for (Declaration dec : decs) {
            s.init(dec.getV());
        }
        return s;
    }
    
    /**
     * Interpret the meaning of a given Block.
     * @param block - Given Block.
     * @param s - Current Scope State.
     * @return Returns the updated State s, resulting from interpretation.
     */
    public static State interpretBlock(Block block, State s) {
        State localState = new State(s);
        localState = interpretDeclarations(block.getDeclarations(), localState);
        localState = interpretStatements(block.getStatements(), localState);
        return s;
    }
    
    /**
     * Interpret the meaning of a given list of Statements.
     * @param a - Given list of Statements.
     * @param s - Current Scope State.
     * @return Returns the updated State s, resulting from interpretation.
     */
    public static State interpretStatements(List<Statement> statements, State s) {
        for (Statement statement : statements) {
            if (statement instanceof Skip) {
                // Do Skip;
                
            } else if (statement instanceof Assignment) {
                Assignment assignment = (Assignment) statement;
                s = interpretAssignment(assignment, s);
                
            } else if (statement instanceof Block) {
                Block block = (Block) statement;
                s = interpretBlock(block, s);
                
            } else if (statement instanceof Conditional) {
                Conditional cond = (Conditional) statement;
                
                Expression testExpr = cond.getTest();
                Statement thenStmt = cond.getThenbranch();
                Statement elseStmt = cond.getElsebranch();
                
                Value<?> val = interpretExpression(testExpr, s);
                Object o = val.getValue();
                if ((o instanceof Boolean)) {
                    Boolean bTest = (Boolean) o;
                    if (bTest) {
                        List<Statement> list = new ArrayList<>();
                        list.add(thenStmt);
                        s = interpretStatements(list, s);
                    } else {
                        List<Statement> list = new ArrayList<>();
                        list.add(elseStmt);
                        s = interpretStatements(list, s);
                    }
                } else {
                    System.err.println("Error: If statement expects a Boolean as the test result. "
                            + "Test result value = " + val);
                }
                
                List<Statement> stmts1 = new ArrayList<>();
                List<Statement> stmts2 = new ArrayList<>();
                stmts1.add(thenStmt);
                stmts2.add(elseStmt);
                
            } else if (statement instanceof Loop) {
                Loop loop = (Loop) statement;
                Expression testExpr = loop.getTest();
                Statement bodyStmt = loop.getBody();
                
                Boolean bLoop = true;
                while (bLoop) {
                    Value<?> val = interpretExpression(testExpr, s);
                    Object o = val.getValue();
                    if ((o instanceof Boolean)) {
                        Boolean bTest = (Boolean) o;
                        if (bTest) {
                            List<Statement> list = new ArrayList<>();
                            list.add(bodyStmt);
                            s = interpretStatements(list, s);
                        } else {
                            bLoop = false;
                        }
                    } else {
                        System.err.println("Error: While loop expects a Boolean as the test result. "
                                + "Test result value = " + val);
                    }
                }
            } 
        }
        return s;
    }
    
    /**
     * Interpret the meaning of a given Assignment.
     * @param a - Given Assignment.
     * @param s - Current Scope State.
     * @return Returns the updated State s, resulting from interpretation.
     */
    public static State interpretAssignment(Assignment a, State s) {
        s.put(a.getTarget(), interpretExpression(a.getSource(), s));
        return s;
    }
    
    /**
     * Interpret the meaning of a given Expression e.
     * @param e - Given Expression.
     * @param s - Current Scope State.
     * @return Returns a Value interpreted from the Expression e.
     *         Returns <code>null</code> if a value could not be interpreted.
     */
    public static Value<?> interpretExpression(Expression e, State s) {
        if (e instanceof Variable) {
            return s.get(e);
            
        } else if (e instanceof Value) {
            return (Value<?>) e;
            
        } else if (e instanceof Binary) {
            Binary b = (Binary) e;
            Operator op = b.getOp();
            Value<?> v1 = interpretExpression(b.getTerm1(), s);
            Value<?> v2 = interpretExpression(b.getTerm2(), s);
            return applyBinary(op, v1, v2);
            
        } else if (e instanceof Unary) {
            Unary u = (Unary) e;
            Operator op = u.getOp();
            Value<?> v = interpretExpression(u.getTerm(), s);
            return applyUnary(op, v);
        }
        
        return null;
    }
    
    /**
     * Apply given Binary operator to the operands. <br>
     * @param op - Binary operator
     * @param v1 - Left operand value
     * @param v2 - Right operand value
     * @return Returns the resulting value from applying the Binary operator to the operands.
     *         Returns <code>null</code> if the given operator could not be applied.
     */
    public static Value<?> applyBinary(Operator op, Value<?> v1, Value<?> v2) {
        
        Boolean b1, b2;
        Integer i1, i2;
        Object o;
        
        switch (op.val) {
            // BooleanOp = && | ||
            case Operator.AND:
                b1 = (Boolean) v1.getValue();
                b2 = (Boolean) v2.getValue();
                return new Value<Boolean>(b1 && b2);
                
            case Operator.OR:
                b1 = (Boolean) v1.getValue();
                b2 = (Boolean) v2.getValue();
                return new Value<Boolean>(b1 || b2);
                
            // RelationalOp = < | <= | == | != | >= | >
            case Operator.LT:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Boolean>(i1 < i2);
                
            case Operator.LE:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Boolean>(i1 <= i2);
                
            case Operator.EQ:
                o = v1.getValue();
                if (o instanceof Integer) {
                    i1 = (Integer) v1.getValue();
                    i2 = (Integer) v2.getValue();
                    return new Value<Boolean>(i1 == i2);
                    
                } else if (o instanceof Boolean) {
                    b1 = (Boolean) v1.getValue();
                    b2 = (Boolean) v2.getValue();
                    return new Value<Boolean>(b1 == b2);
                }
                break;
            case Operator.NE:
                o = v1.getValue();
                if (o instanceof Integer) {
                    i1 = (Integer) v1.getValue();
                    i2 = (Integer) v2.getValue();
                    return new Value<Boolean>(i1 != i2);
                    
                } else if (o instanceof Boolean) {
                    b1 = (Boolean) v1.getValue();
                    b2 = (Boolean) v2.getValue();
                    return new Value<Boolean>(b1 != b2);
                }
                break;
            case Operator.GT:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Boolean>(i1 > i2);
                
            case Operator.GE:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Boolean>(i1 >= i2);
                
            // ArithmeticOp = + | - | * | /
            case Operator.PLUS:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Integer>(i1 + i2);
                
            case Operator.MINUS:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Integer>(i1 - i2);
                
            case Operator.TIMES:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                return new Value<Integer>(i1 * i2);
                
            case Operator.DIV:
                i1 = (Integer) v1.getValue();
                i2 = (Integer) v2.getValue();
                Integer result = ((int) Math.floor( Math.abs(i1 / i2) ) * (int) Math.signum(i1 / i2));
                return new Value<Integer>(result);
                
        }
        return null;
    }
    
    /**
     * Apply given Unary operator to the operand. <br>
     * @param op - Given unary operator.
     * @param v - Operand value.
     * @return Returns the resulting value from applying the Unary operator to the operand.
     *         Returns <code>null</code> if the given operator could not be applied.
     */
    public static Value<?> applyUnary(Operator op, Value<?> v) {
        // UnaryOp = ! | -
        Boolean b;
        Integer i;
        
        switch (op.val) {
            case Operator.NOT:
                b = (Boolean) v.getValue();
                return new Value<Boolean>(!b);
            case Operator.NEG:
                i = (Integer) v.getValue();
                return new Value<Integer>(-i);
        }
        return null;
    }
    
    /**
     * The first argument given to this Interpreter must be a MINI-C file.
     * @param args - First argument must be a MINI-C file.
     */
    public static void main(String[] args ) {
        Parser parser  = new Parser(new Lexer(args[0]) );
        Program program = parser.program();
        if( !TypeChecker.isValid( program ) ) {
            System.out.println("Program is not valid.");
        } else {
            System.out.println( meaning( program ) );
        }
    }
    
}
