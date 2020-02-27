package com.chenjiahao.rouge.entity;


public class Comdescribe {

  private long comdescribeid;
  private long comid;
  private String img;
  private String video;
  private String proposal;
  private String formula;
  private String diyparam;




  public long getComdescribeid() {
    return comdescribeid;
  }

  public void setComdescribeid(long comdescribeid) {
    this.comdescribeid = comdescribeid;
  }


  public long getComid() {
    return comid;
  }

  public void setComid(long comid) {
    this.comid = comid;
  }


  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }


  public String getVideo() {
    return video;
  }

  public void setVideo(String video) {
    this.video = video;
  }


  public String getProposal() {
    return proposal;
  }

  public void setProposal(String proposal) {
    this.proposal = proposal;
  }


  public String getFormula() {
    return formula;
  }

  public void setFormula(String formula) {
    this.formula = formula;
  }


  public String getDiyparam() {
    return diyparam;
  }

  public void setDiyparam(String diyparam) {
    this.diyparam = diyparam;
  }

  @Override
  public String toString() {
    return "Comdescribe{" +
            "comdescribeid=" + comdescribeid +
            ", comid=" + comid +
            ", img='" + img + '\'' +
            ", video='" + video + '\'' +
            ", proposal='" + proposal + '\'' +
            ", formula='" + formula + '\'' +
            ", diyparam='" + diyparam + '\'' +
            '}';
  }
}
