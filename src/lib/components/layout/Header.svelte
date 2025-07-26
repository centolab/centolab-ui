<script lang="ts">
	import { onMount } from 'svelte';

	let activeLink: string = '';
	let isFixedHeader: boolean = false;

	onMount(() => {
		import('bootstrap/dist/js/bootstrap.bundle.min.js');
	});

	function handleNavClick(event: MouseEvent, href: string) {
		event.preventDefault();
		activeLink = href;

		const targetElement = document.querySelector(href);
		if (targetElement) {
			window.scrollTo({
				top: targetElement.getBoundingClientRect().top + window.scrollY - 100,
				behavior: 'smooth'
			});
		}
	}

	function updateHeaderStyle() {
		const windowpos = window.scrollY;

		if (windowpos >= 50) {
			isFixedHeader = true;
		} else {
			isFixedHeader = false;
		}
	}

	onMount(() => {
		updateHeaderStyle();

		const checkScrollPosition = () => {
			const sections = document.querySelectorAll('section[id], div[id]');
			const scrollPosition = window.scrollY + 150;

			sections.forEach((section) => {
				const sectionTop = section.getBoundingClientRect().top + window.scrollY;
				const sectionId = '#' + section.id;

				if (sectionTop <= scrollPosition && sectionTop + section.clientHeight > scrollPosition) {
					activeLink = sectionId;
				}
			});

			updateHeaderStyle();
		};

		window.addEventListener('scroll', checkScrollPosition);

		return () => {
			window.removeEventListener('scroll', checkScrollPosition);
		};
	});
</script>

<header class="main-header {isFixedHeader ? 'fixed-header' : ''}">
	<div class="header-upper">
		<div class="container">
			<div class="header-inner d-flex align-items-center">
				<div class="logo-outer">
					<div class="logo">
						<a href="/"><img src="/images/logos/logo.png" alt="Logo" title="Logo" /></a>
					</div>
				</div>

				<div class="nav-outer clearfix">
					<nav class="main-menu navbar-expand-lg">
						<div class="navbar-header">
							<div class="mobile-logo">
								<a href="/">
									<img src="/images/logos/logo.png" alt="Logo" title="Logo" />
								</a>
							</div>

							<button
								type="button"
								class="navbar-toggle"
								data-bs-toggle="collapse"
								data-bs-target=".navbar-collapse"
								aria-label="menu bar"
							>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="navbar-collapse collapse">
							<ul class="navigation clearfix onepage">
								<li>
									<a
										class="nav-link-click {activeLink === '#how' ? 'active' : ''}"
										href="#how"
										on:click={(e) => handleNavClick(e, '#how')}
									>
										Come funziona
									</a>
								</li>
								<li>
									<a
										class="nav-link-click {activeLink === '#service' ? 'active' : ''}"
										href="#service"
										on:click={(e) => handleNavClick(e, '#service')}
									>
										Servizi
									</a>
								</li>
								<!-- <li>
									<a
										class="nav-link-click {activeLink === '#project' ? 'active' : ''}"
										href="#project"
										on:click={(e) => handleNavClick(e, '#project')}
									>
										Projects
									</a>
								</li>
								<li>
									<a
										class="nav-link-click {activeLink === '#pricing' ? 'active' : ''}"
										href="#pricing"
										on:click={(e) => handleNavClick(e, '#pricing')}
									>
										Pricing
									</a>
								</li> -->
								<li>
									<a
										class="nav-link-click {activeLink === '#faqs' ? 'active' : ''}"
										href="#faqs"
										on:click={(e) => handleNavClick(e, '#faqs')}
									>
										Faqs
									</a>
								</li>
								<li>
									<a
										class="nav-link-click {activeLink === '#book' ? 'active' : ''}"
										href="#book"
										on:click={(e) => handleNavClick(e, '#book')}
									>
										Contatti
									</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>
