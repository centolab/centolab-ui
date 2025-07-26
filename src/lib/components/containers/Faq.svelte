<script lang="ts">
	let faqs = [
		{
			question: 'How secure is my financial data on your platform?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'accone'
		},
		{
			question: 'How does the subscription work?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'acctwo'
		},
		{
			question: 'How much do your plans cost?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'accthree'
		},
		{
			question: 'How quickly can You deliver designs for our business?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'accfour'
		},
		{
			question: 'Can I request revisions to the designs provided?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'accfive'
		},
		{
			question: 'What types of designs does Designpro specialize in?',
			answer:
				'Our childcare center is open from 7:00 AM to 6:00 PM, Monday through Friday. We offer flexible scheduling options to accommodate working families.',
			id: 'accsix'
		}
	];
</script>

<section id="faqs" class="any-questions-area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-12">
				<div class="section-title text-center wow fadeInUp delay-0-2s">
					<h3><i class="ri-arrow-right-up-line"></i> FAQs</h3>
					<h2>Frequently Asked Questions</h2>
					<p>Unsure about subscription design?</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="book-call-intro text-center">
					<img src="/images/about/founder.png" alt="founder" title="founder" />
					<h2>Book a 15-minute intro call</h2>
					<a href="/" class="theme-btn">Schedule now<i class="ri-video-chat-line"></i></a>
					<p>Prefer to email? <a href="mailto:hello@designpro.com">hello@designpro.com</a></p>
				</div>
			</div>
			<div class="col-lg-8 col-md-6">
				<div class="accordion accordion-flush" id="accordionFlushExample">
					{#each faqs as faq (faq.id)}
						<div class="accordion-item">
							<h2 class="accordion-header" id={faq.id}>
								<button
									class="accordion-button collapsed"
									type="button"
									data-bs-toggle="collapse"
									data-bs-target="#{faq.id}Content"
									aria-expanded="false"
									aria-controls="{faq.id}Content"
								>
									{faq.question}
								</button>
							</h2>
							<div
								id="{faq.id}Content"
								class="accordion-collapse collapse"
								data-bs-parent="#accordionFlushExample"
							>
								<div class="accordion-body">
									<p>{faq.answer}</p>
								</div>
							</div>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
</section>
