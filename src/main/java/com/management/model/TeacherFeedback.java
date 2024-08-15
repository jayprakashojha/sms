package model;

public class TeacherFeedback {
    private String teacherName;
    private String teacherEmail;
    private String course;
    private int teachingExperience;
    private String feedback;

    // Getter and Setter methods for teacherName
    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    // Getter and Setter methods for teacherEmail
    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    // Getter and Setter methods for course
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    // Getter and Setter methods for teachingExperience
    public int getTeachingExperience() {
        return teachingExperience;
    }

    public void setTeachingExperience(int teachingExperience) {
        this.teachingExperience = teachingExperience;
    }

    // Getter and Setter methods for feedback
    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
