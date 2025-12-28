# 🃏 CardEngine Expansion Set: GMod Base

This repository contains the Garry's Mod (GMod) Base Expansion Set for the yet to be released CardEngine, a comprehensive collectible card framework for Garry's Mod. This expansion set introduces a variety of cards for players to collect and trade.

## 🚀 Usage

To use this expansion set in your Garry's Mod server, follow these steps:

1. Ensure CardEngine is installed on your Garry's Mod server.

2. Download or clone this repository to your local machine into a `ce_expansion_gmod_base_set` folder.

3. Copy that entire `ce_expansion_gmod_base_set` folder into the `addons/` directory of your Garry's Mod installation.

4. After the above steps, the folder structure should look like this:

    ```plaintext
    garrysmod/
    └── addons/
        └── ce_expansion_gmod_base_set/
            ├── design/
            │   └── ...
            ├── lua/
            │   ├── autorun/
            │   │   └── ce_expansion_gmod_base.lua
            │   └── ce_expansion_gmod_base/
            │       └── ...
            ├── materials/
            │   └── card_engine/
            │       └── expansions/
            │           └── gmod_base_set/
            ├── tools/
            │   └── ...
            └── ...
    ```

## 📦 Distribution

The files in this expansion set are distributed through Cloudflare R2. See [the `sync-to-r2` GitHub Action configuration](.github/workflows/sync-to-r2.yml) to understand how the distribution works.

**In short:** Whenever the contents of the `materials/` folder are changed and pushed to the `main` branch, those changes are automatically uploaded to Cloudflare R2 for distribution. In [the `sh_init.lua` configuration file of this expansion set](lua/ce_expansion_gmod_base/sh_init.lua), the R2 URL is setup as the remote location where CardEngine should look for the card materials:

```lua
CardEngine.ExpansionSet.Register({
    RemoteDownloadURL = "https://<the URL to CloudFlare R2>/",
    --- ... (other configuration options)
})
```

If a new player connects and does not have the card materials yet, CardEngine will download them from that R2 URL.

## 🛠️ Tools

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

4. To convert all `.png` files in the `design/` folder to `.vtf` format in the `materials/card_engine/expansions/gmod_base_set` folder, run the following command:

    ```bash
    npm run convert
    ```
