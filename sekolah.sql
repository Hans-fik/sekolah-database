-- Membuat tabel siswa

-- public.siswa definition
CREATE TABLE public.siswa (
	id serial4 NOT NULL,
	nama varchar(255) NOT NULL,
	umur int4 NULL,
	jurusan varchar(255) NULL,
	CONSTRAINT siswa_pkey PRIMARY KEY (id)
);


-- Membuat tabel nilai

-- public.nilai definition
CREATE TABLE public.nilai (
	id serial4 NOT NULL,
	siswa_id serial4 NOT NULL,
	mata_pelajaran varchar(255) NULL,
	nilai int4 NULL,
	CONSTRAINT nilai_pkey PRIMARY KEY (id)
);

-- public.nilai foreign keys
ALTER TABLE public.nilai 
ADD CONSTRAINT nilai_siswa_id_fkey FOREIGN KEY (siswa_id) REFERENCES public.siswa(id);


-- Memasukan data siswa + ubah jurusan
INSERT INTO public.siswa (nama,umur,jurusan) VALUES
	 ('Naufal',17,'IPS'),
	 ('Sahsa',16,'IPS'),
	 ('Chesa',17,'IPA'),
	 ('Evan',16,'IPA'),
	 ('Aldi',17,'IPS'); --IPA to IPS


-- Memasukan data nilai + hapus Biologi
INSERT INTO public.nilai (mata_pelajaran,nilai) VALUES
	 ('Sejarah',90),
	 ('Bahasa',86),
	 ('Matematika',100),
	 ('Fisika',100);


-- Menampilkan semua siswa
INSERT INTO siswa (nama) VALUES
	 ('Aldi'),
	 ('Naufal'),
	 ('Sahsa'),
	 ('Chesa'),
	 ('Evan');

-- Menampikan siswa dengan jurusan IPA
INSERT INTO siswa (nama) VALUES
	 ('Aldi'),
	 ('Chesa'),
	 ('Evan');

-- Menampilkan rata-rata nilai siswa
INSERT INTO "select siswa.nama, AVG(nilai.nilai) as rata_nilai from siswa 
join nilai on siswa.id=nilai.siswa_id group by siswa.nama" (nama,rata_nilai) VALUES
	 ('Evan',100.0000000000000000),
	 ('Aldi',85.0000000000000000),
	 ('Chesa',100.0000000000000000),
	 ('Sahsa',86.0000000000000000),
	 ('Naufal',90.0000000000000000);