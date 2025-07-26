<script lang="ts">
	import { onMount } from 'svelte';

	let progressPath: SVGPathElement;
	let progressWrap: HTMLButtonElement;
	let pathLength: number;
	let isActive: boolean = false;

	onMount(() => {
		pathLength = progressPath.getTotalLength();

		progressPath.style.transition = 'none';
		progressPath.style.strokeDasharray = `${pathLength} ${pathLength}`;
		progressPath.style.strokeDashoffset = `${pathLength}`;

		progressPath.getBoundingClientRect();

		progressPath.style.transition = 'stroke-dashoffset 10ms linear';

		const updateProgress = () => {
			const scroll = window.scrollY;
			const height = document.documentElement.scrollHeight - window.innerHeight;
			const progress = pathLength - (scroll * pathLength) / height;
			progressPath.style.strokeDashoffset = `${progress}`;

			if (scroll > 150) {
				isActive = true;
			} else {
				isActive = false;
			}
		};

		updateProgress();

		window.addEventListener('scroll', updateProgress);

		return () => {
			window.removeEventListener('scroll', updateProgress);
		};
	});

	function scrollToTop(event: MouseEvent): void {
		event.preventDefault();
		window.scrollTo({
			top: 0,
			behavior: 'smooth'
		});
	}
</script>

<button
	class="progress-wrap cursor-pointer {isActive ? 'active-progress' : ''}"
	bind:this={progressWrap}
	on:click={scrollToTop}
	aria-label="Scroll to top"
>
	<i class="ri-arrow-up-s-line"></i>
	<svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
		<path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" bind:this={progressPath} />
	</svg>
</button>
