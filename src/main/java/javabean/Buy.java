package javabean;




import java.io.Serializable;


public class Buy  {

    private int Clothes=0;
    private int Pants=0;
    private int Shoes=0;
    private String notice;
    private int sum;
    public Buy() {
    }


    public int getClothes() {
        return Clothes;
    }
    public void setClothes(int Clothes) {
        this.Clothes = Clothes;
    }
    public int getPants() {
        return Pants;
    }
    public void setPants(int Pants) {
        this.Pants = Pants;
    }
    public int getShoes() {
        return Shoes;
    }
    public void setShoes(int Shoes) {
        this.Shoes = Shoes;
    }

    public String getNotice() {
        return notice;
    }
    public void setNotice(String notice) {
        this.notice = notice;
    }
    public int getSum() {
        return sum;
    }
    public void setSum(int sum) {
        this.sum = sum;
    }

    public String Cart(){
        notice="";
        notice+=getClothes()+"件衣服 ";
        notice+=getPants()+"件裤子 ";
        notice+=getShoes()+"双鞋 ";

        return notice;
    }
    public int Sum(){
        sum=0;
        sum+=getClothes()*120;
        sum+=getPants()*100;
        sum+=getShoes()*80;
        return sum;
    }

}
