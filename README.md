# Visual Paradigm CE Containerised

### Notes

Due to how the Visual Paradigm script is designed, after configuring the license on the first run the container may stop and require restarting. This is normal behaviour and should only happen on the first run (fix in progress).

I build and run this using `podman` on Linux, no support will be provided for `docker`, other container engines or other operating systems.

## Usage

### Defaults

Podman

- `podman run -d --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/home/$(whoami)/.config/VisualParadigm:/root/.config/VisualParadigm:rw" --rm docker.io/callumio/visual-paradigm-ce`

Docker

- `docker run -d --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/home/$(whoami)/.config/VisualParadigm:/root/.config/VisualParadigm:rw" --rm docker.io/callumio/visual-paradigm-ce`

### With Environment Variables

Podman

- `podman run -d -e DISPLAY=:0 -e PUID=1000 -e PGID=1000 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/home/$(whoami)/.config/VisualParadigm:/root/.config/VisualParadigm:rw" --rm docker.io/callumio/visual-paradigm-ce`

Docker

- `docker run -d -e DISPLAY=:0 -e PUID=1000 -e PGID=1000 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/home/$(whoami)/.config/VisualParadigm:/root/.config/VisualParadigm:rw" --rm docker.io/callumio/visual-paradigm-ce`

## Configuration

### Environment Variables

|         Variable                |           Description                                          |   Default                       |
|---------------------------------|----------------------------------------------------------------|---------------------------------|
| `PUID`                          | User Identifier (Volume Permissions)                           | `1000`                          |
| `PGID`                          | Group Identifier (Volume Permissions)                          | `1000`                          |
| `DISPLAY`                       | X Display ID                                                   | `:0`                            |
| `_JAVA_AWT_WM_NONREPARENTING`   | For (X)Wayland compatibility until OpenJDK Wakefield is usable | `1`                             |         

### Volumes

|         Destination                          |           Description                             |
|----------------------------------------------|---------------------------------------------------|
| `/tmp/.X11-unix:/tmp/.X11-unix`              | X Socket Forwarding                               |
| `/root/.config/VisualParadigm`               | Visual Paradigm Config Folder                     |
| `/root/.config/VisualParadigm/ws/VPProjects` | Visual Paradigm Projects Folder (Optional)        |

## Building

### Buildah

`buildah bud -t visual-paradigm-ce`

### Docker Build

`docker build -t visual-paradigm-ce`
