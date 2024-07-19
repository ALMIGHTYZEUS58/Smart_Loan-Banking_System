class Loan {
  final double amount;
  final String dateApplied;
  final String status;
  final double interestRate;
  final String purpose;
  final String? collateral;
  final String? dateApprovedRejected;
  final String? deadline;
  final bool didUserDefault;
  final int defaultDuration;
  final String penalty;
  final int monthsUsedToPay;
  final List<Map<String, String>> transactions;
  final String referenceNumber;
  final String? extendedDeadline;
  final String? rejectionReason;

  Loan({
    required this.amount,
    required this.dateApplied,
    required this.status,
    required this.interestRate,
    required this.purpose,
    this.collateral,
    this.dateApprovedRejected,
    this.deadline,
    this.didUserDefault = false,
    this.defaultDuration = 0,
    this.penalty = '0',
    this.monthsUsedToPay = 0,
    required this.transactions,
    required this.referenceNumber,
    this.extendedDeadline,
    this.rejectionReason,
  });
}
