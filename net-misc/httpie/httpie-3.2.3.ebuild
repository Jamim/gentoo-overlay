# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
PYTHON_REQ_USE="ssl(+)"
DISTUTILS_USE_PEP517=setuptools

inherit bash-completion-r1 distutils-r1

DESCRIPTION="Modern command line HTTP client"
HOMEPAGE="https://httpie.io https://github.com/httpie/cli https://pypi.org/project/httpie/"
SRC_URI="https://github.com/httpie/cli/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/cli-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/charset-normalizer[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pytest-httpbin[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_install_all() {
	newbashcomp extras/httpie-completion.bash http
	insinto /usr/share/fish/vendor_completions.d
	newins extras/httpie-completion.fish http.fish
	distutils-r1_python_install_all
}
