// https://gautam007.medium.com/unraveling-the-efficiency-of-heap-sort-in-dart-applications-2190fc8c5bc9

void main() {
  List<int> array = [5, 1, 4, 2, 8, 3, 7];
  print('array=' + array.toString());

  heapSort(array);
  print('sorted=' + array.toString());
}

void heapSort(List<int> arr) {
  int n = arr.length;

  // Build max heap
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Move current root to end
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Call max heapify on the reduced heap
    heapify(arr, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // Left child
  int right = 2 * i + 2; // Right child

  // If left child is larger than root
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    // Recursively heapify the affected sub-tree
    heapify(arr, n, largest);
  }
}
