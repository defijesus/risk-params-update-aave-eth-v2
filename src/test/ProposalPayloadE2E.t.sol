// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

// testing libraries
import "@forge-std/Test.sol";

// contract dependencies
import {GovHelpers} from "@aave-helpers/GovHelpers.sol";
import {AaveV2Ethereum} from "@aave-address-book/AaveV2Ethereum.sol";
import {ProposalPayload} from "../ProposalPayload.sol";
import {DeployMainnetProposal} from "../../script/DeployMainnetProposal.s.sol";

contract ProposalPayloadE2ETest is Test {
    address public constant AAVE_WHALE = 0x25F2226B597E8F9514B3F68F00f494cF4f286491;

    uint256 public proposalId;
    ProposalPayload public proposalPayload;

    function setUp() public {
        // To fork at a specific block: vm.createSelectFork(vm.rpcUrl("mainnet"), BLOCK_NUMBER);
        vm.createSelectFork(vm.rpcUrl("mainnet"));

        // Deploy Payload
        proposalPayload = new ProposalPayload();

        // Create Proposal
        vm.prank(AAVE_WHALE);
        proposalId = DeployMainnetProposal._deployMainnetProposal(
            address(proposalPayload),
            0x344d3181f08b3186228b93bac0005a3a961238164b8b06cbb5f0428a9180b8a7 // TODO: Replace with actual IPFS Hash
        );
    }

    function testExecute() public {
        // Pre-execution assertations

        // Pass vote and execute proposal
        GovHelpers.passVoteAndExecute(vm, proposalId);

        // Post-execution assertations
        /// YFI
        (, , , , , , bool yfiBorrowingEnabled, , , bool yfiFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.YFI());
        assertFalse(yfiFrozen);
        assertFalse(yfiBorrowingEnabled);

        /// CRV
        (, , , , , , bool crvBorrowingEnabled, , , bool crvFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.CRV());
        assertFalse(crvFrozen);
        assertFalse(crvBorrowingEnabled);

        /// ZRX
        (, , , , , , , , , bool zrxFrozen) = AaveV2Ethereum.AAVE_PROTOCOL_DATA_PROVIDER.getReserveConfigurationData(
            proposalPayload.ZRX()
        );
        assertTrue(zrxFrozen);

        /// MANA
        (, , , , , , bool manaBorrowingEnabled, , , bool manaFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.MANA());
        assertFalse(manaFrozen);
        assertFalse(manaBorrowingEnabled);

        /// 1INCH
        (, , , , , , bool oneinchBorrowingEnabled, , , bool oneinchFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.ONE_INCH());
        assertFalse(oneinchFrozen);
        assertFalse(oneinchBorrowingEnabled);

        /// BAT
        (, , , , , , bool batBorrowingEnabled, , , bool batFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.BAT());
        assertFalse(batFrozen);
        assertFalse(batBorrowingEnabled);

        /// SUSD
        (, , , , , bool susdUsageAsCollateralEnabled, , , , bool susdFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.SUSD());
        assertFalse(susdFrozen);
        assertFalse(susdUsageAsCollateralEnabled);

        /// ENJ
        (, , , , , , , , , bool enjFrozen) = AaveV2Ethereum.AAVE_PROTOCOL_DATA_PROVIDER.getReserveConfigurationData(
            proposalPayload.ENJ()
        );
        assertFalse(enjFrozen);

        /// GUSD
        (, , , , , bool gusdUsageAsCollateralEnabled, , , , bool gusdFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.GUSD());
        assertFalse(gusdFrozen);
        assertFalse(gusdUsageAsCollateralEnabled);

        /// AMPL
        (, , , , uint256 amplReserveFactor, , , , , bool amplFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.AMPL());
        assertTrue(amplFrozen);
        assertEq(amplReserveFactor, 9_900);

        /// RAI
        (, , , , , , , , , bool raiFrozen) = AaveV2Ethereum.AAVE_PROTOCOL_DATA_PROVIDER.getReserveConfigurationData(
            proposalPayload.RAI()
        );
        assertTrue(raiFrozen);

        /// USDP
        (, , , , , , bool usdpBorrowingEnabled, , , bool usdpFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.USDP());
        assertFalse(usdpFrozen);
        assertFalse(usdpBorrowingEnabled);

        /// LUSD
        (, , , , , , bool lusdBorrowingEnabled, , , bool lusdFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.LUSD());
        assertFalse(lusdFrozen);
        assertFalse(lusdBorrowingEnabled);

        /// xSUSHI
        (, , , , , , bool xsushiBorrowingEnabled, , , bool xsushiFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.X_SUSHI());
        assertFalse(xsushiFrozen);
        assertFalse(xsushiBorrowingEnabled);

        /// DPI
        (, , , , , , bool dpiBorrowingEnabled, , , bool dpiFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.DPI());
        assertFalse(dpiFrozen);
        assertFalse(dpiBorrowingEnabled);

        /// renFIL
        (, , , , uint256 renfilReserveFactor, , , , , bool renfilFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.REN_FIL());
        assertTrue(renfilFrozen);
        assertEq(renfilReserveFactor, 9_900);

        /// MKR
        (, , , , , , bool mkrBorrowingEnabled, , , bool mkrFrozen) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.MKR());
        assertFalse(mkrFrozen);
        assertFalse(mkrBorrowingEnabled);

        /// ENS
        (, , , , , , bool ensBorrowingEnabled, , , ) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.ENS());
        assertFalse(ensBorrowingEnabled);

        /// LINK
        (, , , , , , bool linkBorrowingEnabled, , , ) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.LINK());
        assertFalse(linkBorrowingEnabled);

        /// UNI
        (, , , , , , bool uniBorrowingEnabled, , , ) = AaveV2Ethereum
            .AAVE_PROTOCOL_DATA_PROVIDER
            .getReserveConfigurationData(proposalPayload.UNI());
        assertFalse(uniBorrowingEnabled);
    }
}
