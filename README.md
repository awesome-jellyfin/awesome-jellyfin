<!--lint disable awesome-heading awesome-toc double-link-->

<p align="center">
  <img src="/assets/banner.png" />
  <h1 align="center">Awesome Jellyfin</h1>
</p>

<blockquote align="center"> A List of Awesome Jellyfin Themes and Plugins</blockquote>

<p align="center">
[
  <a href="#-plugins">Plugins</a> •
  <a href="#%EF%B8%8F-metadata-providers">Metadata Providers</a> •
  <a href="THEMES.md">Themes</a> •
  <a href="#-other">Other</a> • 
  <a href="#-snippets">Snippets</a> •
  <a href="#-related">Related</a> • 
  <a href="#contribute">Contribute</a>
]
</p>

## 🧩 Plugins

### UI

<!-- sort -->
- [CustomLogoPlugin](https://github.com/bvolvy/CustomLogoPlugin) - Allows uploading of custom logos to replace the default Jellyfin logo.
- [InPlayerEpisodePreview](https://github.com/Namo2/InPlayerEpisodePreview) - Adds an episode list to the video player.
- [jellyfin-editors-choice-plugin](https://github.com/lachlandcp/jellyfin-editors-choice-plugin) - Adds a Netflix-style, full-width content slider to the home page to feature selected content.
- [jellyfin-icon-metadata](https://github.com/Druidblack/jellyfin-icon-metadata) - Adds metadata provider icons to Jellyfin.
- [jellyfin-plugin-collection-sections](https://github.com/IAmParadox27/jellyfin-plugin-collection-sections) - Adds additional sections to `jellyfin-plugin-home-sections` for collections and playlists.
- [jellyfin-plugin-custom-tabs](https://github.com/IAmParadox27/jellyfin-plugin-custom-tabs) - Add personalized tabs in jellyfin-web for quick access to custom content.
- [jellyfin-plugin-home-sections](https://github.com/IAmParadox27/jellyfin-plugin-home-sections) - Allows users to customize the jellyfin-web home screen with dynamic sections like "Because You Watched" and "Latest Movies".
- [jellyfin-plugin-media-bar](https://github.com/IAmParadox27/jellyfin-plugin-media-bar) - A Featured Content Bar to show off your media collection.
- [jellyscrub `📅`](https://github.com/nicknsy/jellyscrub) - Smooth mouse-over video scrubbing previews.
  <!--lint ignore list-item-indent awesome-list-item-->
  - **NOTE:** Jellyfin 10.9 now natively supports trickplay.

### Playback

<!-- sort -->
- [intro-skipper](https://github.com/intro-skipper/intro-skipper) - Fingerprint audio to automatically detect intro and outro segments in Jellyfin.
- [jellyfin-plugin-cinemamode](https://github.com/CherryFloors/jellyfin-plugin-cinemamode) - A plugin that allows users to enable Jellyfin's Cinema Mode functionality with local trailers and pre-rolls.
- [jellyfin-plugin-enigma2 `📅`](https://github.com/knackebrot/jellyfin-plugin-enigma2) - Supports Vu+ & Enigma2 live TV streamers.

### Integrations & Sync

<!-- sort -->
- [jellyfin-ani-sync](https://github.com/vosmiic/jellyfin-ani-sync) - Automatically tracks and synchronizes anime watching progress between Jellyfin and [Anilist](https://anilist.co/) and other services.
- [jellyfin-plugin-letterboxd-sync](https://github.com/danielveigasilva/jellyfin-plugin-letterboxd-sync) - Automatically syncs your watched movie history with Letterboxd.
- [jellyfin-plugin-listenbrainz](https://github.com/lyarenei/jellyfin-plugin-listenbrainz) - Automatically syncs your music activity with ListenBrainz.
- [jellyfin-plugin-onepace](https://github.com/jwueller/jellyfin-plugin-onepace) - Plugin for the [One Pace](https://onepace.net) project.
- [jellyfin-rpc](https://github.com/Radiicall/jellyfin-rpc) - Displays your current Jellyfin activity directly on Discord.
- [MyAnimeSync](https://github.com/iankiller77/MyAnimeSync) - Automatically synchronizes anime watching progress between Jellyfin and MyAnimeList.
- [Shokofin](https://github.com/ShokoAnime/Shokofin) - A Jellyfin plugin to integrate [Jellyfin](https://jellyfin.org/docs/) with [Shoko Server](https://shokoanime.com/downloads/shoko-server/).

### Library Management

<!-- sort -->
- [Jellyfin Ignore `🔸`](https://github.com/fdett/jellyfin-ignore/) - Ignore filename patterns on library scans.
- [jellyfin-local-posters](https://github.com/NooNameR/Jellyfin.Plugin.LocalPosters/) - Automatically matches and imports local posters using TPDb and MediUX filename formats. Also supports syncing posters from Google Drive.
- [jellyfin-plugin-collection-import](https://github.com/lostb1t/jellyfin-plugin-collection-import) - Create and sort collections by importing from external sources like _mdblist_.
- [jellyfin-plugin-media-cleaner](https://github.com/shemanaev/jellyfin-plugin-media-cleaner) - Automatically removes played media after a specified time period.
- [jellyfin-plugin-meilisearch](https://github.com/arnesacnussem/jellyfin-plugin-meilisearch) - Enhances Jellyfin search speed and accuracy by offloading queries to a Meilisearch instance.
- [media-upload-plugin](https://github.com/grandguyjs/media-upload-plugin) - Media-manager that provides uploads, bulk downloads from URLs, and directory browsing within Jellyfin.

### Metadata & Artwork

<!-- sort -->
- [jellyfin-plugin-animethemes](https://github.com/EusthEnoptEron/jellyfin-plugin-animethemes) - Fetches anime opening and ending themes from [AnimeThemes.moe](https://animethemes.moe/), supporting both audio and video.
- [jellyfin-plugin-hikka](https://github.com/HotMasya/jellyfin-plugin-hikka) - Metadata and images for anime and manga from the Hikka website.
- [jellyfin-plugin-itunes](https://github.com/lyarenei/jellyfin-plugin-itunes) - A Jellyfin plugin that fetches album and artist metadata from Apple Music.
- [jellyfin-plugin-kinopoisk](https://github.com/LinFor/jellyfin-plugin-kinopoisk) - Metadata provider for [Kinopoisk](https://www.kinopoisk.ru/).
- [jellyfin-plugin-languageTags](https://github.com/TheXaman/jellyfin-plugin-languageTags) - Adds language tags to media based on audio tracks using FFmpeg.
- [jellyfin-plugin-myanimelist](https://github.com/ryandash/jellyfin-plugin-myanimelist) - Provides MyAnimeList metadata for anime.
- [Jellyfin Plugin PhoenixAdult](https://github.com/DirtyRacer1337/Jellyfin.Plugin.PhoenixAdult) - Metadata provider helps fill Jellyfin/Emby with information for your adult videos by pulling from the original site.
- [Jellyfin Plugin Stash](https://github.com/DirtyRacer1337/Jellyfin.Plugin.Stash) - Metadata provider for [Stash](https://github.com/stashapp/stash).
- [Jellyfin Plugin ThePornDB](https://github.com/ThePornDatabase/Jellyfin.Plugin.ThePornDB) - Metadata provider for ThePornDB.
- [jellyfin-youtube-metadata-plugin](https://github.com/ankenyr/jellyfin-youtube-metadata-plugin) - YouTube Metadata Plugin.

### Auth & Access

<!-- sort -->
- [jellyfin-plugin-ldapauth](https://github.com/jellyfin/jellyfin-plugin-ldapauth) - Allows the use of ldap as an auth provider.
- [jellyfin-plugin-sso `🔸`](https://github.com/9p4/jellyfin-plugin-sso) - Allows users to sign in through an SSO provider.
- [Jellyfin.Plugin.StreamLimit](https://github.com/JellyboxAD/Jellyfin.Plugin.StreamLimit) - Allows limiting the number of simultaneous streams per user.
- [TeleJelly](https://github.com/hexxone/TeleJelly) - Allows users to sign in through the [Telegram Login Widget](https://core.telegram.org/widgets/login).

### Misc

<!-- sort -->
- [Jellyfin-Newsletter-Plugin `🔸` `📅`](https://github.com/Cloud9Developer/Jellyfin-Newsletter-Plugin) - Newsletters for recently added media.
- [jellyfin-plugin-pages](https://github.com/IAmParadox27/jellyfin-plugin-pages) - Enables other plugins to create custom Jellyfin pages that match the native UI.
- [jellyfin-plugin-skin-manager `📅`](https://github.com/danieladov/jellyfin-plugin-skin-manager) - Helps you to download and install skins.
- [jellyfin-plugin-TelegramNotifier](https://github.com/RomainPierre7/jellyfin-plugin-TelegramNotifier) - Receive notifications of Jellyfin server events via Telegram.

---

## 👾 Other

### Request & Discovery

<!-- sort -->
- [AudioBookRequest](https://github.com/markbeep/AudioBookRequest) - A request management tool for audiobooks on Plex, Jellyfin, and Audiobookshelf.
- [jelly-clipper `🔸`](https://github.com/arnolicious/jelly-clipper) - A web application for creating, sharing, and managing video clips from your Jellyfin media library.
- [jellyhub](https://github.com/Zigl3ur/jellyhub) - A web app that indexes media from multiple Jellyfin servers into a single searchable hub, letting you see which server hosts the content you're looking for.
- [JellyPlex-Watched](https://github.com/luigi311/JellyPlex-Watched) - Syncs watch history between Jellyfin, Plex, and Emby Servers.
- [JellySearch](https://gitlab.com/DomiStyle/jellysearch) - A fast full-text search proxy for Jellyfin using Meilisearch.
- [jellyseerr](https://github.com/Fallenbagel/jellyseerr) - A request management and media discovery tool.
- [List-Sync `🔸`](https://github.com/Woahai321/list-sync) - Automatically import movies and TV shows from IMDB or Trakt lists into [Jellyseerr](https://github.com/Fallenbagel/jellyseerr).
- [reiverr `🔸`](https://github.com/aleksilassila/reiverr) - Combined interface for JF, TMDB, Radarr and Sonarr.

### Automation & Orchestration

<!-- sort -->
- [autopulse](https://github.com/dan-online/autopulse) - A lightweight automation service that updates Plex, Jellyfin, and Emby libraries based on notifications from media organizers like Sonarr and Radarr.
- [autoscan](https://github.com/Cloudbox/autoscan) - Replaces the default Plex and Emby behaviour for picking up changes on the file system.
- [CineSync](https://github.com/sureshfizzy/CineSync) - A Python based library management tool designed to organize debrid & local libraries without the support of Sonarr & Radarr.
- [Fixarr `🔸`](https://github.com/sachinsenal0x64/FIXARR) - Media Renamer and Backup tool. (Backup still WIP)
- [Jellyfin-Auto-Collections](https://github.com/ghomasHudson/Jellyfin-Auto-Collections) - A tool to automatically make and update collections based on internet lists such as IMDb and letterboxd.
- [Jellyfin Notification System `📅`](https://github.com/Fahmula/jellyfin-telegram-notifier) - Sends Telegram notifications with media images whenever a new movie, series, season, or episode is added to Jellyfin.
- [jellyplist `🔸`](https://github.com/kamilkosek/jellyplist) - Utility for syncing Spotify playlists to Jellyfin.
- [jelly-watch-wise](https://github.com/Joker-KP/jelly-watch-wise) - A standalone app that monitors and enforces Jellyfin watch time limits per user, with API integration and a simple GUI.
- [MUMC](https://github.com/terrelsa13/MUMC) - Query and delete unwanted media content from your Jellyfin server.
- [Playlifin](https://gitlab.com/Krafting/playlifin-gtk) - Converts YouTube Music playlists to Jellyfin playlists.
- [speedrr](https://github.com/itschasa/speedrr) - Change your torrent client's upload speed dynamically, on certain events such as when a Plex/Jellyfin stream starts.
- [SuggestArr](https://github.com/giuseppe99barchetta/SuggestArr) - Automatically request suggested movies and TV shows to [Jellyseerr](https://github.com/Fallenbagel/jellyseerr) based on recently watched.
- [trailarr](https://github.com/nandyalu/trailarr) - Manages trailer downloads for your Radarr and Sonarr libraries.

### Metadata & Artwork Tools

<!-- sort -->
- [jellyfin-cover-art-generator](https://github.com/Tetrax-10/jellyfin-cover-art-generator) - CLI tool to generate Jellyfin styled library coverart from a backdrop.
- [JellyfinEasyMetadataManager](https://github.com/CesarBianchi/JellyfinEasyMetadataManager) - A desktop tool for managing and editing metadata in Jellyfin libraries.
- [jellyfin-poster-hrd-logo](https://github.com/Druidblack/jellyfin-poster-hrd-logo/tree/main) - Automatically downloads covers for HDR movies from TMDb and applies an HDR logo in the top-right corner.
- [jellyfin-Seasonals](https://github.com/CodeDevMLH/Jellyfin-Seasonals) - A collection of seasonal themes/animations.
- [Jellyfin Segment Editor](https://github.com/endrl/segment-editor) - Manage Jellyfin Media Segment positions.
- [jellyfin-tools](https://github.com/eebette/jellyfin-tools) - This library is to generate images with Jellyfin-like styling (shadow overlay and library title text) from source images.
- [Jellyfin Update Poster](https://github.com/Iceshadow1404/JellyfinUpdatePoster) - Handles ZIP files containing multiple cover images from [ThePosterDB](https://theposterdb.com/) and [MediUX](https://mediux.pro). Set Downloader for [MediUX](https://mediux.pro).
- [jellytools](https://github.com/cleverdevil/jellytools) - A CLI tool for synchronizing artwork and collections to Jellyfin from Plex and to generate and embed customizable animated library card videos in the Jellyfin UI.
- [Posterizarr](https://github.com/fscorrupt/Posterizarr) - Automates the creation of high-quality posters, backgrounds, and title cards for Plex, Jellyfin, and Emby with customizable overlays and direct uploads.
- [subgen](https://github.com/McCloudS/subgen) - Autogenerate subtitles using OpenAI Whisper Model via Jellyfin.
- [TitleCardMaker](https://github.com/CollinHeist/TitleCardMaker) - Automated title card maker for Plex, Jellyfin, and Emby.
- [ytdl-sub](https://github.com/jmbannon/ytdl-sub) - Automate downloading and metadata generation with YoutubeDL.

### Analytics & Stats

<!-- sort -->
- [jellyfin-rewind](https://github.com/Chaphasilor/jellyfin-rewind) - A _Spotify Wrapped_-like app made for people who use Jellyfin for listening to music.
- [Jellystat](https://github.com/CyferShepard/Jellystat) - A free and open source Statistics App for Jellyfin.
- [OpenSubtitlesDownload](https://github.com/emericg/OpenSubtitlesDownload) - Automatically or manually download subtitles using CLI/Gnome/KDE.
- [streamystats](https://github.com/fredrikburmester/streamystats) - Statistics service for Jellyfin, providing analytics and data visualization.

### Auth & Access

<!-- sort -->
- [jfa-go](https://github.com/hrfee/jfa-go) - User- / Invite-Management system for Jellyfin.
- [wizarr](https://github.com/Wizarrrr/wizarr) - Advanced user invitation and management system.

### Misc

<!-- sort -->
- [jellyfin-mods](https://github.com/BobHasNoSoul/jellyfin-mods) - A collection of things you can do to personalize Jellyfin.
- [Jellyman](https://github.com/Smiley-McSmiles/jellyman) - A CLI Program for installing and managing Jellyfin.
- [JellyRoller `🔸`](https://github.com/LSchallot/JellyRoller) - A CLI Jellyfin Controller.
- [mnamer `📅`](https://github.com/jkwill87/mnamer) - Highly customizable tool to automatically rename all media files.
- [tunarr](https://github.com/chrisbenincasa/tunarr) - Create custom live TV channels from your Plex or Jellyfin library with a web UI and IPTV support.
- [xsrv.jellyfin](https://github.com/nodiscc/xsrv/tree/master/roles/jellyfin) - Ansible role to deploy and configure Jellyfin.
- [ytdlp2STRM](https://github.com/fe80Grau/ytdlp2STRM) - Streams YouTube, Twitch and more via yt-dlp to Jellyfin.

---

## Guides

<!-- sort -->
- [jellyfin-on-macos](https://github.com/Digital-Shane/jellyfin-on-macos) - Guide for hosting Jellyfin on macOS with dynamic DNS, geo-filtering, and monitoring dashboards.
- [TRaSH Guides](https://trash-guides.info/) - Guides for Sonarr, Radarr, and Bazarr, along with related tools.

---

## 🌌 Related

This section includes software, guides and tools that are not _specifically_ designed to work with Jellyfin, but can be useful for tasks related to media management or to enhance Jellyfin's functionality.

<!-- sort -->
- [calibre2jellyfin](https://github.com/shawn61cp/calibre2jellyfin) - Python script to construct a Jellyfin ebook library from a Calibre library.
- [Cloud Seeder](https://github.com/ipv6rslimited/cloudseeder) - A 1-click installer and maintainer for Jellyfin on Windows, Mac and Linux.
- [ErsatzTV `🔸`](https://github.com/ErsatzTV/ErsatzTV) - Stream custom live channels using your own media.
- [Explo](https://github.com/LumePart/Explo) - Automated music discovery tool that recommended tracks based on your listening history.
- [locatarr](https://github.com/Locatarr/Locatarr) - A list of tools used to automate the downloading and organization of media files.
  - [radarr](https://github.com/Radarr/Radarr) - Automates downloading & management of movies [`🟣 TRaSH Guide`](https://trash-guides.info/Radarr/).
  - [sonarr](https://github.com/Sonarr/Sonarr) - Automates downloading & management of TV series [`🟣 TRaSH Guide`](https://trash-guides.info/Sonarr/).
  - [tdarr `📛`](https://github.com/HaveAGitGat/Tdarr) - Distributed transcode automation + Library analytics + Video health checking.
  - [recyclarr](https://github.com/recyclarr/recyclarr) - Automatically sync TRaSH guides to Sonarr and Radarr instances.
- [MediaTracker](https://github.com/bonukai/MediaTracker) - Media tracker and user rating platform with [Jellyfin integration](https://github.com/bonukai/jellyfin-plugin-mediatracker).
- [Movary `🔸`](https://github.com/leepeuker/movary) - Media tracker and user rating platform.
- [Multi Scrobbler `🔸`](https://github.com/foxxmd/multi-scrobbler) - Scrobbles music from many sources to many clients.
- [rffmpeg](https://github.com/joshuaboniface/rffmpeg) - A remote FFmpeg wrapper, commonly used for transcoding media on more capable machines.
- [Threadfin](https://github.com/Threadfin/Threadfin) - M3U proxy for Jellyfin (Based on xTeVe).
- [watchstate](https://github.com/ArabCoders/watchstate) - Sync play state between different media servers.

## Contribute

Contributions welcome! But please read the [contribution guidelines](CONTRIBUTING.md) first.  
You can also [create a new issue](https://github.com/awesome-jellyfin/awesome-jellyfin/issues/new).

---

<!--lint ignore unordered-list-marker-style-->

- Early Release / BETA software `🔸`
- Closed-Source Software `📛`
- Stale / Inactive / May not work anymore `📅`

