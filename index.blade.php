@extends('layouts.app')

@section('title', 'Daftar Produk - HachiPetShop')

@section('content')
<div class="container py-5 mt-5">
    <div class="row mb-4">
        <div class="col-md-8">
            <h1 class="display-6 fw-bold">Produk Kami</h1>
            <p class="text-muted">Berbagai kebutuhan hewan peliharaan Anda</p>
        </div>
        <div class="col-md-4">
            <form action="{{ route('products.index') }}" method="GET" class="d-flex">
                <input type="text" name="search" class="form-control me-2" placeholder="Cari produk..." value="{{ request('search') }}">
                <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-white fw-bold">Filter Kategori</div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="{{ route('products.index') }}" class="text-decoration-none {{ !request('category') ? 'fw-bold text-primary' : '' }}">Semua</a></li>
                        @foreach($categories as $cat)
                            <li class="mb-2">
                                <a href="{{ route('products.index', ['category' => $cat]) }}" 
                                   class="text-decoration-none {{ request('category') == $cat ? 'fw-bold text-primary' : '' }}">
                                    {{ ucfirst($cat) }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            @if($products->count())
                <div class="row">
                    @foreach($products as $product)
                        <div class="col-md-4 col-sm-6 mb-4">
                            <div class="card h-100 shadow-sm product-card">
                                <img src="{{ $product->image_url ?? 'https://via.placeholder.com/300x200?text=Product' }}" 
                                     class="card-img-top" alt="{{ $product->name }}" style="height: 200px; object-fit: cover;">
                                <div class="card-body">
                                    <h5 class="card-title">{{ $product->name }}</h5>
                                    <p class="card-text text-muted small">{{ Str::limit($product->description, 80) }}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="h5 text-primary">{{ $product->formatted_price }}</span>
                                        <a href="{{ route('products.show', $product->slug) }}" class="btn btn-sm btn-outline-primary">Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="d-flex justify-content-center mt-4">
                    {{ $products->links() }}
                </div>
            @else
                <div class="alert alert-info">Tidak ada produk yang ditemukan.</div>
            @endif
        </div>
    </div>
</div>

<style>
    .product-card {
        transition: transform 0.3s ease;
    }
    .product-card:hover {
        transform: translateY(-5px);
    }
</style>
@endsection