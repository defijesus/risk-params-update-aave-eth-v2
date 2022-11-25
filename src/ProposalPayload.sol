// SPDX-License-Identifier: AGPL-3.0-only

/*
   _      ΞΞΞΞ      _
  /_;-.__ / _\  _.-;_\
     `-._`'`_/'`.-'
         `\   /`
          |  /
         /-.(
         \_._\
          \ \`;
           > |/
          / //
          |//
          \(\
           ``
     defijesus.eth
*/

pragma solidity ^0.8.15;

import {IAaveEcosystemReserveController} from "./external/aave/IAaveEcosystemReserveController.sol";
import {AaveV2Ethereum} from "@aave-address-book/AaveV2Ethereum.sol";

/**
 * @title <TITLE>
 * @author Llama
 * @notice <DESCRIPTION>
 * Governance Forum Post:
 * Snapshot:
 */
contract ProposalPayload {

    address public constant renFIL = 0xD5147bc8e386d91Cc5DBE72099DAC6C9b99276F5;
    address public constant MKR = 0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2;
    address public constant ENS = 0xC18360217D8F7Ab5e7c516566761Ea12Ce7F9D72;
    address public constant LINK = 0x514910771AF9Ca656af840dff83E8264EcF986CA;
    address public constant UNI = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
    address public constant xSUSHI = 0x8798249c2E607446EfB7Ad49eC89dD1865Ff4272;
    address public constant BAT = 0x0D8775F648430679A709E98d2b0Cb6250d2887EF;
    address public constant sUSD = 0x57Ab1ec28D129707052df4dF418D58a2D46d5f51;
    address public constant ENJ = 0xF629cBd94d3791C9250152BD8dfBDF380E2a3B9c;
    address public constant GUSD = 0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd;
    address public constant AMPL = 0xD46bA6D942050d489DBd938a2C909A5d5039A161;
    address public constant RAI = 0x03ab458634910AaD20eF5f1C8ee96F1D6ac54919;
    address public constant USDP = 0x8E870D67F660D95d5be530380D0eC0bd388289E1;
    address public constant ZRX = 0xE41d2489571d322189246DaFA5ebDe1F4699F498;
    address public constant MANA = 0x0F5D2fB29fb7d3CFeE444a200298f468908cC942;
    address public constant YFI = 0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e;
    address public constant CRV = 0xD533a949740bb3306d119CC777fa900bA034cd52;
    address public constant oneInch = 0x111111111117dC0aa78b770fA6A738034120C302;
    address public constant LUSD = 0x5f98805A4E8be255a32880FDeC7F6728C6568bA0;
    address public constant DPI = 0x1494CA1F11D487c2bBe4543E90080AeBa4BA3C2b;


    /// @notice The AAVE governance executor calls this function to implement the proposal.
    function execute() external {
        /// we use 9_900 instead of 10_000 to aave v2 bug.
        /// unfreezing a reserve when its not frozen is a noop   
        /// freezing an already frozen reserve is a noop

        /// YFI
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(YFI);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(YFI);

        /// CRV
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(CRV);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(CRV);

        /// ZRX
        AaveV2Ethereum.POOL_CONFIGURATOR.freezeReserve(ZRX);

        /// MANA
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(MANA);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(MANA);

        /// 1INCH
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(oneInch);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(oneInch);

        /// BAT
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(BAT);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(BAT);

        /// SUSD TODO


        /// ENJ
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(ENJ);

        /// GUSD TODO


        /// AMPL
        AaveV2Ethereum.POOL_CONFIGURATOR.freezeReserve(AMPL);
        AaveV2Ethereum.POOL_CONFIGURATOR.setReserveFactor(AMPL, 9_900);

        /// RAI
        AaveV2Ethereum.POOL_CONFIGURATOR.freezeReserve(RAI);

        /// USDP
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(USDP);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(USDP);

        /// LUSD
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(LUSD);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(LUSD);

        /// xSUSHI
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(xSUSHI);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(xSUSHI);

        /// DPI
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(DPI);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(DPI);

        /// renFIL
        AaveV2Ethereum.POOL_CONFIGURATOR.freezeReserve(renFIL);
        AaveV2Ethereum.POOL_CONFIGURATOR.setReserveFactor(renFIL, 9_900);

        /// MKR
        AaveV2Ethereum.POOL_CONFIGURATOR.unfreezeReserve(MKR);
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(MKR);

        /// ENS
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(ENS);

        /// LINK
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(LINK);

        /// UNI
        AaveV2Ethereum.POOL_CONFIGURATOR.disableBorrowingOnReserve(UNI);
    }
}
