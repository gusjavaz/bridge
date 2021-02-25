// SPDX-License-Identifier: MIT-open-group
pragma solidity >=0.6.4;
pragma experimental ABIEncoderV2;

import "./AccessControlLibrary.sol";
import "./ValidatorsStorageLibrary.sol";

contract ValidatorsUpdateFacet is AccessControlled {
    function addFacet(bytes4 selector, address facet) external onlyOperator {
        ValidatorsStorageLibrary.ValidatorsStorage storage vs = ValidatorsStorageLibrary.validatorsStorage();

        require(vs.routing[selector] == address(0), "selector already exists");

        vs.routing[selector] = facet;
    }

    function removeFacet(bytes4 selector) external onlyOperator {
        ValidatorsStorageLibrary.ValidatorsStorage storage vs = ValidatorsStorageLibrary.validatorsStorage();

        require(vs.routing[selector] != address(0), "selector does not exist");

        delete vs.routing[selector];
    }

    function replaceFacet(bytes4 selector, address facet) external onlyOperator {
        ValidatorsStorageLibrary.ValidatorsStorage storage vs = ValidatorsStorageLibrary.validatorsStorage();

        require(vs.routing[selector] != address(0), "selector does not exist");

        vs.routing[selector] = facet;
    }

}