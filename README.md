# 🧪 Aliaksei's Gentoo Linux overlay

This is my personal [ebuild repository][ebuild-repo]
where I try to keep some packages up-to-date.

## 💾 Installation

In case you want to add it, please use [eselect-repository][eselect-repo].
```shell
eselect repository add mim git https://github.com/Jamim/gentoo-overlay.git
```

I encourage you to initially [mask][masking] all the content of any new overlay, including mine.
```shell
echo '*/*::mim' >> /etc/portage/package.mask/overlays
```

## 🧑🏽‍🔬 Usage

You need to explicitly unmask packages that you intend to install from this overlay.
```shell
echo net-im/telegram-desktop::mim >> /etc/portage/package.unmask/overlays
```

Then you can install them as usual.
```shell
emerge net-im/telegram-desktop::mim -av
```

Note that `::mim` can be omitted, so that you can keep receiving
updates from the main [Gentoo Linux][gentoo] repo or other overlays.

## 💡 Support

Feel free to submit [an issue][new-issue] in case you
have any trouble with this overlay or its content.

[ebuild-repo]: https://wiki.gentoo.org/wiki/Ebuild_repository
[eselect-repo]: https://wiki.gentoo.org/wiki/Eselect/Repository
[masking]: https://wiki.gentoo.org/wiki/Ebuild_repository#Masking_enabled_ebuild_repositories
[gentoo]: https://www.gentoo.org
[new-issue]: https://github.com/Jamim/gentoo-overlay/issues/new
