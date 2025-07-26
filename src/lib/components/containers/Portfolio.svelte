<script lang="ts">
	import { onMount } from 'svelte';
	import PhotoSwipeLightbox from 'photoswipe/lightbox';
	import 'photoswipe/style.css';

	let galleryElement: HTMLDivElement;

	interface ImageItem {
		src: string;
		alt: string;
		category: string;
		title: string;
		link: string;
		width: number;
		height: number;
		type: 'image';
	}

	const images: ImageItem[] = [
		{
			src: '/images/projects/work2.jpg',
			alt: 'Image of a branch with flowers',
			category: 'Website',
			title: 'A Branch with Flowers',
			link: '/images/projects/work2.jpg',
			width: 1200,
			height: 800,
			type: 'image'
		},
		{
			src: '/images/projects/work3.jpg',
			alt: 'Image of orange rose flower',
			category: 'Apps',
			title: 'Orange Rose Flower',
			link: '/images/projects/work3.jpg',
			width: 1200,
			height: 800,
			type: 'image'
		},
		{
			src: '/images/projects/work4.jpg',
			alt: 'Image of green plant on a desk',
			category: 'Landing',
			title: 'Green Plant on a Desk',
			link: '/images/projects/work4.jpg',
			width: 1200,
			height: 800,
			type: 'image'
		},
		{
			src: '/images/projects/work5.jpg',
			alt: 'Image of orange rose flower',
			category: 'Mockup',
			title: 'Orange Rose Flower',
			link: '/images/projects/work5.jpg',
			width: 1200,
			height: 800,
			type: 'image'
		}
	];

	onMount(() => {
		const lightbox = new PhotoSwipeLightbox({
			gallery: '.portfolio-grid',
			children: 'a.pswp-item',
			pswpModule: () => import('photoswipe')
		});

		lightbox.init();
	});
</script>

<div class="projects-area" id="project">
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-12">
				<div class="section-title text-center wow fadeInUp delay-0-2s">
					<h3><i class="ri-arrow-right-up-line"></i> Projects</h3>
					<h2>Featured Projects</h2>
					<p>Get a glimpse of our work</p>
				</div>
			</div>
		</div>
		<div class="row g-4 portfolio-grid" bind:this={galleryElement}>
			{#each images as item (item.src)}
				<div class="col-md-6 col-xl-6 portfolio-item category-2">
					<a
						href={item.link}
						data-pswp-width={item.width}
						data-pswp-height={item.height}
						class="pswp-item"
						target="_blank"
						rel="noreferrer"
					>
						<div class="portfolio-box">
							<img src={item.src} alt={item.alt} />
							<span class="portfolio-category">{item.category}</span>
							<div class="portfolio-caption">
								<h1>{item.title}</h1>
							</div>
						</div>
					</a>
				</div>
			{/each}
		</div>
		<div class="row">
			<div class="hero-btns text-center">
				<a href="#book" class="theme-btn">View all works</a>
			</div>
		</div>
	</div>
</div>
