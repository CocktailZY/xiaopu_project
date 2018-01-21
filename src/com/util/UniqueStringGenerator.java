package com.util;
/**
 * 
 */

/**
 * @author Think
 * 
 */
public class UniqueStringGenerator
 
{

	public UniqueStringGenerator()

	{

	}

	public   synchronized String getUniqueString()

	{

		if (generateCount > 99999)

			generateCount = 0;

		String uniqueNumber = Long.toString(System.currentTimeMillis())
				+ Integer.toString(generateCount);

		generateCount++;

		return uniqueNumber.substring(2, 10);

	}

	@SuppressWarnings("unused")
	private static final int MAX_GENERATE_COUNT = 99999;

	private static int generateCount = 0;



@SuppressWarnings("static-access")
public static void main(String[] args) {
	System.out.println(new UniqueStringGenerator().getUniqueString());
}
}