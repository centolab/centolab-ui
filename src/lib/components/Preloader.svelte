<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { browser } from '$app/environment';

	onMount(() => {
		const animatePreloader = () => {
			const svgElement = document.getElementById('preloaderSvg');

			if (!(svgElement instanceof SVGPathElement)) {
				console.error('Element is not an SVG path element');
				return;
			}

			const svg = svgElement;
			const tl = gsap.timeline();
			const curve = 'M0 502S175 272 500 272s500 230 500 230V0H0Z';
			const flat = 'M0 2S175 1 500 1s500 1 500 1V0H0Z';

			tl.to('.preloader-heading .load-text, .preloader-heading .cont', {
				delay: 1.5,
				y: -100,
				opacity: 0
			});

			tl.to(svg, {
				duration: 0.5,
				attr: { d: curve },
				ease: 'power2.easeIn'
			}).to(svg, {
				duration: 0.5,
				attr: { d: flat },
				ease: 'power2.easeOut'
			});

			tl.to('.preloader', {
				y: -1500
			});

			tl.to('.preloader', {
				zIndex: -1,
				display: 'none'
			});
		};

		if (browser && document.readyState === 'complete') {
			animatePreloader();
		} else {
			window.addEventListener('load', animatePreloader);

			return () => {
				window.removeEventListener('load', animatePreloader);
			};
		}
	});
</script>

<div class="preloader">
	<svg viewBox="0 0 1000 1000" preserveAspectRatio="none">
		<path id="preloaderSvg" d="M0,1005S175,995,500,995s500,5,500,5V0H0Z"></path>
	</svg>
	<div class="preloader-heading">
		<div class="load-text">
			<span>L</span>
			<span>o</span>
			<span>a</span>
			<span>d</span>
			<span>i</span>
			<span>n</span>
			<span>g</span>
		</div>
	</div>
</div>
