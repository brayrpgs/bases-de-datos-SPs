
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Puntuation {
    private int idPuntuation;
    private int idProduct;
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

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
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

    @Override
    public String toString() {
        return "Puntuation{" + "idPuntuation=" + idPuntuation + ", idProduct=" + idProduct + ", review=" + review + ", puntuationValue=" + puntuationValue + '}';
    }
    
    
}
