package me.mandali.niroban.exception;

public class InvalidInputException extends RuntimeException {
    public InvalidInputException(String message) {
        super("Invalid input: " + message);
    }
}
