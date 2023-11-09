<script setup>

    import GuestLayout from '@/Layouts/GuestLayout.vue';


    defineProps({
        error_message: String,
    });

</script>

<template>    
<GuestLayout :canLogin="false" :canRegister="false" title="Error">
    
    <Head title="Error" />

    <v-container class="h-100 pa-16">

        <v-card class="pa-16">

            <img src="/img/error.gif" class="w-100">
        

            <h1>OOPS!</h1>

            <p>{{ error_message }}</p>


        </v-card>
            
    </v-container>
        
    <CTA></CTA>
    
</GuestLayout>
</template>
