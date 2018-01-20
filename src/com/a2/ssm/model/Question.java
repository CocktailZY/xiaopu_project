package com.a2.ssm.model;

public class Question {
    private Integer quId;

    private String quQuestion;

    private String quAnswer;

    private Integer quUserid;

    public Integer getQuId() {
        return quId;
    }

    public void setQuId(Integer quId) {
        this.quId = quId;
    }

    public String getQuQuestion() {
        return quQuestion;
    }

    public void setQuQuestion(String quQuestion) {
        this.quQuestion = quQuestion == null ? null : quQuestion.trim();
    }

    public String getQuAnswer() {
        return quAnswer;
    }

    public void setQuAnswer(String quAnswer) {
        this.quAnswer = quAnswer == null ? null : quAnswer.trim();
    }

    public Integer getQuUserid() {
        return quUserid;
    }

    public void setQuUserid(Integer quUserid) {
        this.quUserid = quUserid;
    }
}