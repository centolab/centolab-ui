<script lang="ts">
	import { onMount } from 'svelte';

	export let title: string = 'Top companies trust us with their design';
	export let direction: 'left' | 'right' = 'left';
	export let speed: 'slow' | 'medium' | 'fast' = 'slow';
	export let companies: { src: string; alt: string }[] = [
		{ src: '/images/company-logo/company1.png', alt: 'company logo' },
		{ src: '/images/company-logo/company2.png', alt: 'company logo' },
		{ src: '/images/company-logo/company3.png', alt: 'company logo' },
		{ src: '/images/company-logo/company4.png', alt: 'company logo' },
		{ src: '/images/company-logo/company5.png', alt: 'company logo' },
		{ src: '/images/company-logo/company6.png', alt: 'company logo' }
	];

	let isAnimated = false;

	onMount(() => {
		if (!window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
			addAnimation();
		}
	});

	function addAnimation(): void {
		isAnimated = true;

		setTimeout(() => {
			const scrollers = document.querySelectorAll('.scroller');

			scrollers.forEach((scroller) => {
				scroller.setAttribute('data-animated', 'true');

				const scrollerInner = scroller.querySelector('.scroller__inner');

				if (scrollerInner) {
					const scrollerContent = Array.from(scrollerInner.children);

					scrollerContent.forEach((item) => {
						const duplicatedItem = item.cloneNode(true) as HTMLElement;
						duplicatedItem.setAttribute('aria-hidden', 'true');
						scrollerInner.appendChild(duplicatedItem);
					});
				}
			});
		}, 0);
	}
</script>

<div class="company-design-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2>{title}</h2>
				<div class="company-list">
					<div
						class="scroller"
						data-direction={direction}
						data-speed={speed}
						class:animated={isAnimated}
					>
						<div class="scroller__inner">
							{#each companies as company (company.src)}
								<img src={company.src} alt={company.alt} />
							{/each}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
