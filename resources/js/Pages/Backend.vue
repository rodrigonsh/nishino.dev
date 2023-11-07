<script setup>

import {Head, Link, useForm} from '@inertiajs/vue3';

import GuestLayout from '@/Layouts/GuestLayout.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

const years = new Date().getFullYear() - 2001
const age = new Date().getFullYear() - 1984

</script>

<template>    
<GuestLayout canLogin="canRegister" canRegister="canRegister" title="Backend">
    
    <Head title="Backend" />

    <v-container class="h-100">

        <h1>Backend</h1>

        <p>Botar uns icones</p>
        <p>Falar sobre os frameworks</p>

    </v-container>
        
        
</GuestLayout>
</template>
