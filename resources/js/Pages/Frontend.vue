<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';
import CTA from '@/Components/CTA.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Frontend">
    
    <Head title="Frontend" />

    <v-container class="h-100">

        <h1>Frontend</h1>

        <p>Botar uns icones</p>
        <p>Falar sobre os frameworks</p>

    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>
