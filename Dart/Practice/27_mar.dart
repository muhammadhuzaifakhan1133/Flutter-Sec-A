void main() {
  print("main function");
  bool ifPrime = checkPrime(27);
  if (ifPrime) {
    print("Yes it is a prime number");
  } else {
    print("No it is not a prime number");
  }
}

bool checkPrime(num number) {
  bool prime = true;
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      prime = false;
    }
  }
  return prime;
}
