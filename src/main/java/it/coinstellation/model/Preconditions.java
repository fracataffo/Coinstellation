package it.coinstellation.model;

import java.lang.IllegalArgumentException;

public final class Preconditions {
	private Preconditions() {
		throw new UnsupportedOperationException("La classe non può essere istanziata");
	}

	public static int checkPositive(int value, String paramName) {
		if (value <= 0) {
			throw new IllegalArgumentException("Il valore del parametro "+paramName+" non è positivo (valore attuale = "+value);
		}

		return value;
	}

	public static long checkPositive(long value, String paramName) {
		if (value <= 0) {
			throw new IllegalArgumentException("Il valore del parametro "+paramName+" non è positivo (valore attuale = "+value);
		}

		return value;
	}

	public static int checkNonNegative(int value, String paramName) {
		if (value < 0) {
			throw new IllegalArgumentException("Il valore del parametro "+paramName+" è negativo (valore attuale = "+value);
		}

		return value;
	}

	public static long checkNonNegative(long value, String paramName) {
		if (value < 0) {
			throw new IllegalArgumentException("Il valore del parametro "+paramName+" è negativo (valore attuale = "+value);
		}

		return value;
	}
}
