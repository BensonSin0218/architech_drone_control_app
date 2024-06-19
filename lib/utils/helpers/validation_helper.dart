class ValidationHelper {
  static bool isIpAddress(String value) {
    List<String> bytes = value.split('.');

    if (bytes.length != 4) {
      return false;
    }

    for (String byte in bytes) {
      int byteValue = int.tryParse(byte) ?? -1;

      if (byteValue < 0 || byteValue > 255) {
        return false;
      }
    }

    return true;
  }
}
