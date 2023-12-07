<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import { onMounted } from 'vue';

const props = defineProps({
    clientes: Array,
    errors: Array,
});

</script>

<template>
    <Head title="Clientes" />

    <AdminLayout title="Clientes">
        

        <v-container class='w-100 pa-7 bg-dialog'>
            <h1>Clientes</h1>
        </v-container>
        
        
        
        <v-container class="pa-7">
            

            <div class="y-3" v-for="cli in props.clientes">
                <Link class="text-black" :href="'/admin/clientes/'+cli.id">

                <h3>{{ cli.name  }}</h3>
                <p>{{ cli.email }}</p>

                </Link>
            </div>

        </v-container>

    </AdminLayout>
</template>
