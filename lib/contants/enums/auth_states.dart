/// Auth states enum
enum AuthStates {
  /// This is how we know that the user is not logged in
  initial,

  /// This state shows that the user is currently logging in
  loading,

  /// This is how we know that the user is logged in
  success,

  /// This state shows that an error occurred while logging in
  error,
}
