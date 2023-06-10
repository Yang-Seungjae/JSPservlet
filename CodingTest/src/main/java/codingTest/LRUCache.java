package codingTest;

import java.util.ArrayList;
import java.util.List;

public class LRUCache {

	private List<String> listCache;
	private int cacheSize;

	public LRUCache(int cSize) {

		cacheSize = cSize;
		listCache = new ArrayList<String>();

	}

	public boolean getCity(String City) {
		int idxCache = 0;
		boolean rtn = false;
		if (listCache.size() == 0) {
			listCache.add(City);
			rtn = false;

		} else {

			while (idxCache < listCache.size()) {
				String cache = listCache.get(cacheSize);
				if (cache.equalsIgnoreCase(City)) {
					changeSlot(idxCache, City);
					rtn = true;
					break;
				} else {
					idxCache++;
					continue;
				}
			}
			if (!rtn) {
				if (listCache.size() < cacheSize) {
					listCache.add(City);
					rtn = false;

				} else {
					changeSlot(listCache.size(), City);
				}
			}
		}
		return rtn;

	}

	public void changeSlot(int numOfSlot, String value) {
		int idx = 0;

		if (numOfSlot == 0) {
			numOfSlot = listCache.size() - 1;
		}
		while (idx < numOfSlot) {
			listCache.set(idx, listCache.get(idx + 1));// 한칸씩 이동하면서 list에 있는 값을 가져오는 것
			idx++;

		}
		listCache.set(numOfSlot, value);
	}
}
