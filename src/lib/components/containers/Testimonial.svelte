<script lang="ts">
	import { onMount } from 'svelte';
	import Swiper from 'swiper';
	import { Navigation, Autoplay } from 'swiper/modules';
	import 'swiper/css';
	import 'swiper/css/navigation';

	interface Testimonial {
		quote: string;
		name: string;
		position: string;
		image?: string;
	}

	const testimonials: Testimonial[] = [
		{
			quote:
				'Financial planners help people to knowledge in about how to invest and in save their moneye the most efficient way eve plan ners help people tioniio know ledige in about how.',
			name: 'Zonathon Doe',
			position: 'CEO & Founder X',
			image: '/images/testimonials/author1.jpg'
		},
		{
			quote:
				'Financial planners help people to knowledge in about how to invest and in save their moneye the most efficient way eve plan ners help people tioniio know ledige in about how.',
			name: 'Liana Marie',
			position: 'Lead Designer Meta',
			image: '/images/testimonials/author2.jpg'
		},
		{
			quote:
				'Financial planners help people to knowledge in about how to invest and in save their moneye the most efficient way eve plan ners help people tioniio know ledige in about how.',
			name: 'Zonathon Doe',
			position: 'CEO & Founder X',
			image: '/images/testimonials/author1.jpg'
		},
		{
			quote:
				'Financial planners help people to knowledge in about how to invest and in save their moneye the most efficient way eve plan ners help people tioniio know ledige in about how.',
			name: 'Liana Marie',
			position: 'Lead Designer Meta',
			image: '/images/testimonials/author2.jpg'
		}
	];

	let swiper: Swiper;

	onMount(() => {
		swiper = new Swiper('.testimonials-swiper', {
			modules: [Navigation, Autoplay],
			slidesPerView: 2,
			spaceBetween: 30,
			autoplay: {
				delay: 2000,
				disableOnInteraction: false
			},
			speed: 1000,
			navigation: {
				nextEl: '.testimonial-next',
				prevEl: '.testimonial-prev'
			},
			breakpoints: {
				0: {
					slidesPerView: 1
				},
				768: {
					slidesPerView: 2
				}
			}
		});

		return () => {
			if (swiper) swiper.destroy();
		};
	});
</script>

<section class="testimonials-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="testimonials-wrap">
					<div class="testimonials-swiper swiper">
						<div class="swiper-wrapper">
							{#each testimonials as testimonial, index (index)}
								<div class="swiper-slide testimonial-item wow fadeInUp delay-0-3s">
									<div class="text">
										"{testimonial.quote}"
									</div>
									<div class="author">
										{#if testimonial.image}
											<img src={testimonial.image} alt="Author" />
										{/if}
									</div>
									<div class="testi-des">
										<h5>{testimonial.name}</h5>
										<span>{testimonial.position}</span>
									</div>
								</div>
							{/each}
						</div>
					</div>
					<div class="slider-arrows wow fadeInUp delay-0-6s text-center pt-40">
						<button class="testimonial-prev slick-arrow" aria-label="previous testimonial">
							<i class="ri-arrow-left-s-line"></i>
						</button>
						<button class="testimonial-next slick-arrow" aria-label="next testimonial">
							<i class="ri-arrow-right-s-line"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
