package codingTest;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CacheApp {
	public static void main(String[] args) {

		List<String> cities = new ArrayList<String>();
		Scanner scanner = new Scanner(System.in);
		System.out.println("캐시 크기 : ");
		int cacheSize = scanner.nextInt();

		System.out.println("도시 이름을 넣어주세요(구분자 , ) : ");
		Scanner sc1 = new Scanner(scanner.next()).useDelimiter("\\s*,\\s*");
		while (sc1.hasNext()) {
			cities.add(sc1.next());
		}
		System.out.println(cities);

		LRUSchedule LRUSched = new LRUSchedule(cacheSize, cities);
		System.out.println(LRUSched.getRunTime());
	}

}