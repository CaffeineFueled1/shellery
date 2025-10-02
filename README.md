# Shellery

Simple SSG to create dynamic gallery one-pagers in your shell! Shell+Gallery

[Issue Tracker and Requests](https://git.uphillsecurity.com/cf7/shellery/issues)

- Status: Beta
- Instance/ Demo: 
- Inspired by

---

## Features

**Available**:
- Simple use without dependencies
- no Javascript
- Lightbox of image with anchor
- Order of images via filename
- Container available
- Simple to modify (Pictures and Templates)

**Ideas**:
- check file formats
- remove exif data
- conf file for options
- anonymize file names
- sections via file names

**Not planned**:

---

## Usage

### Docker / Podman

```bash
mkdir -p images output

podman run -v $(pwd)/images:/app/images -v $(pwd)/output:/app/output git.uphillsecurity.com/cf7/shellery:latest
```

### Local

- Clone
- Put images into `./images/`
- `./build.sh`
- Check `./output/`

Modify files accordingly.

### Docker Build

Build and run:
```bash
docker build -t localhost/shellery .
docker run -v $(pwd)/images:/app/images -v $(pwd)/output:/app/output localhost/shellery
```

The generated gallery will be in `./output/index.html`

---

## Security

For security concerns or reports, please contact via `hello a t uphillsecurity d o t com` [gpg](https://uphillsecurity.com/gpg).

---

## License

**Apache License**

Version 2.0, January 2004

http://www.apache.org/licenses/

- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Patent use
- ✅ Private use
- ✅ Limitations
- ❌Trademark use
- ❌Liability
- ❌Warranty
