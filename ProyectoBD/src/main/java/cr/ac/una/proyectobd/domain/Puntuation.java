
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Puntuation {
    private int idPuntuation;
    private Product product;
    private String review;
    private int puntuationValue;

    public Puntuation() {
    }

    public int getIdPuntuation() {
        return idPuntuation;
    }

    public void setIdPuntuation(int idPuntuation) {
        this.idPuntuation = idPuntuation;
    }

    public Puntuation(int idPuntuation, Product product, String review, int puntuationValue) {
        this.idPuntuation = idPuntuation;
        this.product = product;
        this.review = review;
        this.puntuationValue = puntuationValue;
    }

    

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getPuntuationValue() {
        return puntuationValue;
    }

    public void setPuntuationValue(int puntuationValue) {
        this.puntuationValue = puntuationValue;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Puntuation{" + "idPuntuation=" + idPuntuation + ", product=" + product + ", review=" + review + ", puntuationValue=" + puntuationValue + '}';
    }
    
    

  
    
    
}
