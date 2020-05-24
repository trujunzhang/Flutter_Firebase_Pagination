enum FBCollections {
  Restaurants,
  Cellular,
  Offline,
}

fbCollectionToString(FBCollections path) {
  switch (path) {
    case FBCollections.Restaurants:
      return "restaurants";
    default:
      return "none";
  }
}
