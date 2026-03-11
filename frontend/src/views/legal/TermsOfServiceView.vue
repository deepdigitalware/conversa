<script setup lang="ts">
const effectiveDate = 'March 11, 2026'
</script>

<template>
  <div class="min-h-screen bg-background text-foreground flex items-center">
    <main class="mx-auto w-full max-w-4xl px-6 py-12">
      <h1 class="text-3xl font-bold tracking-tight">Terms of Service</h1>
      <p class="mt-1 text-sm text-muted-foreground">Effective date: {{ effectiveDate }}</p>

      <section class="mt-8 space-y-3">
        <h2 class="text-xl font-semibold">1. Acceptance of Terms</h2>
        <p class="text-sm leading-6 text-muted-foreground">By using this application, you agree to these Terms of Service and applicable platform policies, including Meta and WhatsApp Business platform requirements.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">2. Permitted Use</h2>
        <p class="text-sm leading-6 text-muted-foreground">You must use the service lawfully and only for authorized business communications. You are responsible for consent, message content, and legal compliance in your jurisdiction.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">3. Account Responsibilities</h2>
        <p class="text-sm leading-6 text-muted-foreground">You are responsible for keeping credentials secure and for activities performed through your account. Unauthorized use may lead to suspension.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">4. Availability and Changes</h2>
        <p class="text-sm leading-6 text-muted-foreground">We may modify, suspend, or discontinue features as needed for maintenance, security, or compliance. We may update these terms periodically.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">5. Limitation of Liability</h2>
        <p class="text-sm leading-6 text-muted-foreground">To the maximum extent permitted by law, the service is provided "as is" without warranties, and we are not liable for indirect or consequential damages.</p>
      </section>

      <section class="mt-6 space-y-3">
        <h2 class="text-xl font-semibold">6. Contact</h2>
        <p class="text-sm leading-6 text-muted-foreground">For legal or support queries, contact: <a class="underline underline-offset-4" href="mailto:deepversestudio@gmail.com">deepversestudio@gmail.com</a></p>
      </section>
    </main>
  </div>
</template>
