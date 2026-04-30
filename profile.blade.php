{{-- resources/views/customer/profile.blade.php --}}
@extends('layouts.app')

@section('title', 'Profil Pelanggan - HachiPetShop')

@section('content')
<main style="margin-top: 100px; min-height: 70vh;">
    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-decoration-none">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Profil Saya</li>
            </ol>
        </nav>

        <div class="row g-4">
            <!-- Kolom Kiri: Informasi Profil -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="card-body p-4 text-center">
                        <div class="avatar-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 50%;">
                            <i class="fas fa-user fa-3x text-white"></i>
                        </div>
                        <h3 class="fw-bold mb-1">{{ $customer->name ?? 'Nama tidak tersedia' }}</h3>
                        <p class="text-muted mb-3">
                            <i class="fas fa-map-marker-alt me-1"></i> 
                            {{ $customer->address ?? 'Alamat belum diisi' }}
                        </p>
                        <div class="border-top pt-3 mt-2">
                            <div class="row text-start">
                                <div class="col-12 mb-2">
                                    <i class="fas fa-phone-alt text-primary me-2"></i> 
                                    <span>{{ $customer->phone ?? '-' }}</span>
                                </div>
                                <div class="col-12 mb-2">
                                    <i class="fas fa-envelope text-primary me-2"></i> 
                                    <span>{{ $customer->email ?? '-' }}</span>
                                </div>
                                <div class="col-12">
                                    <i class="fas fa-calendar-alt text-primary me-2"></i> 
                                    <span>Member sejak {{ $customer->created_at ? $customer->created_at->translatedFormat('F Y') : '-' }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Info Hewan Peliharaan (jika ada relasi) -->
                <div class="card border-0 shadow-sm rounded-4 mt-4">
                    <div class="card-header bg-transparent border-0 pt-4 px-4 fw-bold">
                        <i class="fas fa-paw text-primary me-2"></i> Hewan Peliharaan
                    </div>
                    <div class="card-body px-4 pb-4">
                        @forelse($customer->pets ?? [] as $pet)
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-light rounded-circle p-2 me-3">
                                <i class="fas fa-dog text-secondary"></i>
                            </div>
                            <div>
                                <div class="fw-semibold">{{ $pet['name'] }}</div>
                                <small class="text-muted">{{ $pet['type'] }} • {{ $pet['age'] }}</small>
                            </div>
                        </div>
                        @empty
                        <p class="text-muted text-center">Belum ada data hewan peliharaan.</p>
                        @endforelse
                    </div>
                </div>
            </div>

            <!-- Kolom Kanan: Riwayat Layanan -->
            <div class="col-lg-8">
                <ul class="nav nav-tabs border-0 gap-2" id="serviceTab" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active rounded-pill px-4" id="grooming-tab" data-bs-toggle="tab" data-bs-target="#grooming" type="button" role="tab">
                            <i class="fas fa-cut me-2"></i>Riwayat Grooming
                        </button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link rounded-pill px-4" id="boarding-tab" data-bs-toggle="tab" data-bs-target="#boarding" type="button" role="tab">
                            <i class="fas fa-hotel me-2"></i>Riwayat Penitipan
                        </button>
                    </li>
                </ul>

                <div class="tab-content mt-4">
                    <!-- Grooming -->
                    <div class="tab-pane fade show active" id="grooming">
                        <div class="card border-0 shadow-sm rounded-4">
                            <div class="card-body p-4">
                                <h5 class="card-title mb-4 fw-bold">
                                    <i class="fas fa-scissors text-primary me-2"></i> Layanan Grooming
                                </h5>
                                @forelse($groomings as $groom)
                                <div class="border-bottom pb-3 mb-3">
                                    <div class="d-flex flex-wrap justify-content-between align-items-start">
                                        <div>
                                            <h6 class="fw-bold mb-1">{{ $groom->pet_name }} - {{ $groom->service }}</h6>
                                            <div class="small text-muted">
                                                <i class="fas fa-calendar-day me-1"></i> {{ \Carbon\Carbon::parse($groom->date)->translatedFormat('d F Y') }}
                                                &nbsp;|&nbsp;
                                                <i class="fas fa-user-check me-1"></i> Groomer: {{ $groom->groomer }}
                                            </div>
                                        </div>
                                        <div class="mt-2 mt-sm-0">
                                            <span class="badge bg-success rounded-pill px-3 py-2">{{ $groom->status }}</span>
                                            <span class="ms-2 fw-semibold text-primary">Rp {{ number_format($groom->price, 0, ',', '.') }}</span>
                                        </div>
                                    </div>
                                    <div class="mt-2 small bg-light p-2 rounded">
                                        <i class="fas fa-info-circle text-secondary me-1"></i> Proses: 
                                        {{ $groom->process_detail ?? 'Mandi, blow dry, potong kuku, bersihkan telinga, potong rambut.' }}
                                    </div>
                                </div>
                                @empty
                                <div class="text-center py-4 text-muted">
                                    <i class="fas fa-paw fa-2x mb-2 d-block"></i>
                                    Belum ada riwayat grooming.
                                </div>
                                @endforelse
                            </div>
                        </div>
                    </div>

                    <!-- Penitipan -->
                    <div class="tab-pane fade" id="boarding">
                        <div class="card border-0 shadow-sm rounded-4">
                            <div class="card-body p-4">
                                <h5 class="card-title mb-4 fw-bold">
                                    <i class="fas fa-building me-2"></i> Layanan Penitipan
                                </h5>
                                @forelse($penitipans as $penitipan)
                                <div class="border-bottom pb-3 mb-3">
                                    <div class="d-flex flex-wrap justify-content-between align-items-start">
                                        <div>
                                            <h6 class="fw-bold mb-1">{{ $penitipan->nama_hewan }} - Penitipan {{ $penitipan->total_days }} hari</h6>
                                            <div class="small text-muted">
                                                <i class="fas fa-calendar-alt me-1"></i> 
                                                {{ \Carbon\Carbon::parse($penitipan->tanggal_mulai)->translatedFormat('d M Y') }} - 
                                                {{ \Carbon\Carbon::parse($penitipan->tanggal_selesai)->translatedFormat('d M Y') }}
                                            </div>
                                        </div>
                                        <div class="mt-2 mt-sm-0">
                                            <span class="badge bg-success rounded-pill px-3 py-2">{{ $penitipan->status }}</span>
                                            <span class="ms-2 fw-semibold text-primary">Rp {{ number_format($penitipan->price, 0, ',', '.') }}</span>
                                        </div>
                                    </div>
                                    <div class="mt-2 small bg-light p-2 rounded">
                                        <i class="fas fa-clipboard-list me-1"></i> <strong>Catatan:</strong> {{ $penitipan->notes ?? '-' }}<br>
                                        <i class="fas fa-bed me-1"></i> Kandang bersih, minum terjaga, playtime 2x sehari.
                                    </div>
                                </div>
                                @empty
                                <div class="text-center py-4 text-muted">
                                    <i class="fas fa-dog fa-2x mb-2 d-block"></i>
                                    Belum ada riwayat penitipan.
                                </div>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tombol Aksi -->
                <div class="d-flex flex-wrap gap-3 justify-content-end mt-4">
                    <a href="{{ route('grooming') }}" class="btn btn-outline-primary rounded-pill px-4">
                        <i class="fas fa-plus me-1"></i> Booking Grooming
                    </a>
                    <a href="{{ route('penitipan') }}" class="btn btn-primary rounded-pill px-4">
                        <i class="fas fa-calendar-check me-1"></i> Booking Penitipan
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

@push('styles')
<style>
    .nav-tabs .nav-link {
        background-color: #f1f3f5;
        color: #495057;
        font-weight: 500;
        border: none;
        transition: all 0.2s ease;
    }
    .nav-tabs .nav-link:hover {
        background-color: #e9ecef;
        transform: translateY(-2px);
    }
    .nav-tabs .nav-link.active {
        background: linear-gradient(90deg, var(--primary), var(--primary-light));
        color: white;
        box-shadow: 0 4px 10px rgba(93, 63, 211, 0.3);
    }
    .avatar-circle {
        transition: transform 0.3s ease;
    }
    .avatar-circle:hover {
        transform: scale(1.05);
    }
    .card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 30px -10px rgba(0,0,0,0.1) !important;
    }
    @media (max-width: 768px) {
        .nav-tabs .nav-link {
            font-size: 0.85rem;
            padding: 0.5rem 1rem;
        }
    }
</style>
@endpush
@endsection