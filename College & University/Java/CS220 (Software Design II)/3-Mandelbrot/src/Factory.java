
/**
 * 
 * @author Kong Jimmy Vang
 *
 * @param <Product>
 * @param <Ingredient>
 */
public interface Factory<Product, Ingredient> {
    public Product build(Ingredient item);
}
