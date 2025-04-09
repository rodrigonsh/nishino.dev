<?php

use App\Http\Controllers\Cliente\ClienteHome;
use App\Http\Controllers\Cliente\ClienteProjetos;
use App\Http\Controllers\Cliente\ClienteChat;
use App\Http\Controllers\Cliente\ClienteFinanceiro;
use App\Http\Controllers\Cliente\ClienteDocs;

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ContatoController;
use App\Http\Controllers\ChatController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use TCG\Voyager\Models\Post;
use App\Models\Project;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin'    => false,
        'canRegister' => false,
        'projetos'    => Project::all()
    ]);
});

Route::get('/about', function () {
    return Inertia::render('About', [
        'canLogin'    => false,
        'canRegister' => false,
        
        
    ]);
})->name('about');


Route::get('/frontend', function () {
    return Inertia::render('Frontend', [
        'canLogin'    => false,
        'canRegister' => false,
    ]);
})->name('frontend');

Route::get('/backend', function () {
    return Inertia::render('Backend', [
        'canLogin'    => false,
        'canRegister' => false,
    ]);
})->name('backend');

Route::get('/consultoria', function () {
    return Inertia::render('Consultoria', [
        'canLogin'    => false,
        'canRegister' => false,
    ]);
})->name('consultoria');


Route::get('/blog', function () {

    return Inertia::render('Blog', [
        'canLogin'    => false,
        'canRegister' => false,
        
        
        'posts' => Post::all()
    ]);
})->name('blog');

Route::get('/blog/{slug}', function (string $slug) {

    $post = Post::where('slug', $slug)->firstOrFail();

    return Inertia::render('Post', [
        'canLogin'    => false,
        'canRegister' => false,
        
        
        'post' => $post
    ]);
})->name('post');

Route::get('/projeto/{slug}', function (string $slug) {

    $projeto = Project::where('slug', $slug)->firstOrFail();

    return Inertia::render('Projeto', [
        'canLogin'    => false,
        'canRegister' => false,
        'projeto'     => $projeto
    ]);
    
})->name('projeto');

Route::get('/contato', function () {
    return Inertia::render('Contact', [
        'canLogin'    => false,
        'canRegister' => false,
        
        
    ]);
});

Route:: post('/contato', [ContatoController::class, 'enviar'])->name('enviar');

Route::get('/todoke', function () {
    return Inertia::render('TodokeProject', [
        'canLogin'    => false,
        'canRegister' => false,
    ]);
})->name('todoke');

Route:: get('/harvey', [ChatController::class, 'index'])->name('chat');
Route:: post('/harvey', [ChatController::class, 'message'])->name('harvey-message');




Route::middleware(['auth', 'verified'])->group(function () {
    
    Route:: get('/cliente', [ClienteHome::class, 'index'])->name('cliente.home');

    Route:: get('/cliente/projetos', [ClienteProjetos::class, 'index'])->name('cliente.projetos');
    Route:: get('/cliente/getProjetos', [ClienteProjetos::class, 'get'])->name('cliente.getProjetos');
    
    Route:: get('/cliente/atendimento', [ClienteChat::class, 'index'])->name('cliente.atendimento');
    Route:: post('/cliente/atendimento', [ClienteChat::class, 'message'])->name('atendimento-message');
    Route:: get('/cliente/atendimento/setSubject/{id}', [ClienteChat::class, 'setSubject'])->name('cliente.setSubject');

    Route:: get('/cliente/financeiro', [ClienteFinanceiro::class, 'index'])->name('cliente.financeiro');

    Route:: get('/cliente/docs', [ClienteDocs::class, 'index'])->name('cliente.docs');

});

Route::middleware('auth')->group(function () {
    Route:: get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route:: patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route:: delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


require __DIR__.'/auth.php';
require __DIR__.'/admin.php';


Route::group(['prefix' => 'voyager'], function () {
    Voyager:: routes();
});
