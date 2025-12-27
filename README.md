# 🃏 CardEngine Expansion Set: GMod Base

This repository contains the Garry's Mod (GMod) Base Expansion Set for the yet to be released CardEngine, a comprehensive collectible card framework for Garry's Mod. This expansion set introduces a variety of cards for players to collect and trade.

## Tools

This expansion set comes with a handy tool to convert `.png` card designs into the required `.vtf` format for use in Garry's Mod.

### PNG to VTF Converter

To convert your `.png` card designs to `.vtf`, follow these steps:

1. Open a terminal or command prompt.

2. Navigate to the [`tools/`](tools/) directory of this repository:

    ```bash
    cd tools/
    ```

3. Install the required node modules:

    ```bash
    npm install
    ```

4. To convert all `.png` files in the `design/` folder to `.vtf` format in the `materials/card_engine/ce_gmod_base_set` folder, run the following command:

    ```bash
    npm run convert
    ```
