# ARCHIVED — superseded by LawrenceEaden/homelab

This was an early "Raspberry Pi Plex server" setup with a couple of Docker compose files. **No longer maintained as of 2026-05-20.**

It's been replaced by a single Beelink-based homelab running Proxmox with separate LXCs for each service. The current home for everything is the private repo **`LawrenceEaden/homelab`** — Docker compose files for the media stack live there at `lxc/100-media/stacks/`, with the same components (Portainer, Samba, *arr suite, Jellyfin, etc.) but better organised and with full per-service documentation, secrets handling, and operational runbooks.

If you arrived here looking for a specific compose snippet or convention, the new repo is private but the patterns are documented through the open-source-strategy referenced in its READMEs.

Keeping this repo around as a read-only archive because some external links still point at it. Do not fork — it is years out of date.
