contract AccessManager {

    mapping(address => bool) public registry;

    function grantAccess(address assetAddr) {
        registry[assetAddr] = true;
    }

    function isAuthorized(address assetAddr) constant returns (bool) {
        return registry[assetAddr];
    }
}