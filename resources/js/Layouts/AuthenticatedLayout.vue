<script>

export default {

    data: () => ({
      drawer: (window.innerWidth > 600),
    }),

}

</script>

<script setup>

    import { Link } from '@inertiajs/vue3';

    import { useAppStore } from './../store.js'

    import { computed } from 'vue'

    const store = useAppStore()

    const getLang = computed( function()
    {
        return store.lang
    })

    const changeLang = function()
    {
        store.toggleLang()
    }

    defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
        title: String,
    });

    const getTrans = function(msg)
    {

        if ( undefined == store ) return;

        let trans = {
            'projetos':
            {
                'pt': "Projetos",
                'en': "Projects",
                'es': "Proyectos",
            },
            'atendimento':
            {
                'pt': "Aria (atendimento)",
                'en': "Aria (atendimento)",
                'es': "Aria (atendimento)",
            },
            'financeiro':
            {
                'pt': "Financeiro",
                'en': "Billing",
                'es': "Facturas",
            },
            'documentos':
            {
                'pt': "Documentos",
                'en': "Documents",
                'es': "Documientos",
            },
        }


        return trans[msg][store.lang]
    }

    const getAboutTrans = computed(function()
    {
        let trans = {
            'pt': "Saiba Mais",
            'en': "About me",
            'es': "Acerca",
        }

        return trans[store.lang]
    })

    const getContactTrans = computed(function()
    {
        let trans = {
            'pt': "Contato",
            'en': "Call me",
            'es': "Cuenta conmigo",
        }

        return trans[store.lang]
    })

    

</script>


<template>

    <v-app :lang="store.lang">

    <v-navigation-drawer color="surf" v-model="drawer">
        <v-container class="pa-5 d-flex flex-column ">

            <Link id="menuLogo" href="/" class="d-block w-75 mt-6 mx-auto">
                <img src="/img/logo-nsh.svg" class="app-logo d-block w-100 mb-3" />
            </Link>
            
            <Link class="mt-1 mb-5" href="/cliente">
                <span lang="pt" class="text-center">Área do Cliente</span>
                <span lang="en" class="text-center">Customer Area</span>
                <span lang="es" class="text-center">Area de Cliente</span>
            </Link>
            
                <v-list density="compact" nav>

                    <Link href="/cliente/projetos">

                    <v-list-item 
                        prepend-icon="mdi-folder-cog"
                        :title="getTrans('projetos')"
                        :ripple="true"
                        link
                    ></v-list-item>

                    </Link>

                    <v-divider />
                    
                    <Link href="/cliente/atendimento">

                        <v-list-item 
                            prepend-icon="mdi-message"
                            :title="getTrans('atendimento')"
                            :ripple="true"
                            link
                        ></v-list-item>

                    </Link>

                    <v-divider />

                    <Link href="/cliente/financeiro">
                    <v-list-item 
                        prepend-icon="mdi-cash"
                        :title="getTrans('financeiro')"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <Link href="/cliente/docs">
                    <v-list-item 
                        prepend-icon="mdi-text-box"
                        :title="getTrans('documentos')"
                        :ripple="true"
                    ></v-list-item>
                    </Link>

                    <v-divider />

                    <v-list-item 
                        prepend-icon="mdi-translate"
                        :title="getLang"
                        :ripple="true"
                        @click="changeLang"
                    ></v-list-item>

                </v-list>

        </v-container>
    </v-navigation-drawer>

    <v-app-bar class="bg-nishino">

        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

        <v-app-bar-title>
            {{ title }}
        </v-app-bar-title>
       

        <v-spacer></v-spacer>

        <v-btn
            prepend-icon="mdi-account"
            append-icon="mdi-menu-down"
        >

        {{ $page.props.auth.user.name }}
        
    
        <v-menu offset-y activator="parent">
            
            <v-list>

                <v-list-item>
                <v-list-item-title>
                    <Link :href="route('profile.edit')"> Profile </Link>
                </v-list-item-title>
                </v-list-item>

                <v-list-item>
                <v-list-item-title>
                    <Link :href="route('logout')" method="post" as="button"> Log Out </Link>
                </v-list-item-title>
                </v-list-item>
            
            </v-list>

        </v-menu>

    </v-btn>
                                  

    </v-app-bar>


    <v-main class="bg-forest">
        <slot />

        <v-container class="bg-footer">
            <strong>NISHINO LTDA</strong><br />
            48.129.023/0001-27
        </v-container>

    </v-main>

    </v-app>


</template>

