extension NumberParser on String {
  String toFormattedNumber() {
    assert(this.isNotEmpty);
    if (this.length == 3) {
      return this;
    } else {
      String formattedString = '';
      for (int i = this.length; i > 0; i--) {
        if (i == this.length) {
          String originalNumber = this.substring(this.length - 3);
          formattedString += this
              .replaceRange(this.length - 3, this.length, ',$originalNumber');
          i -= 4;
        } else {
          String originalNumber = formattedString.substring(i);
          formattedString = formattedString.replaceRange(
              i, formattedString.length, ',$originalNumber');
          i -= 1;
        }
      }

      return formattedString;
    }
  }
}
