contract Consumer {
  InfoFeed feed;
  uint global;

  function setFeed(address addr) { feed = InfoFeed(addr); }
  function callFeed() { global = feed.info(); }
}

contract InfoFeed {
  function info() returns (uint ret) { return 42; }
}