CREATE TABLE Country (
    country VARCHAR PRIMARY KEY,
    native_name VARCHAR,
    iso2 CHAR(2),
    iso3 CHAR(3),
    population INT,
    area FLOAT,
    capital VARCHAR,
    capital_lat FLOAT,
    capital_lng FLOAT,
    region VARCHAR,
    continent VARCHAR
);

CREATE TABLE City (
    station_id SERIAL PRIMARY KEY,
    city_name VARCHAR UNIQUE,
    country VARCHAR REFERENCES Country(country),
    state VARCHAR,
    iso2 CHAR(2),
    iso3 CHAR(3),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE DailyWeather (
    station_id INT REFERENCES City(station_id),
    city_name VARCHAR,
    date DATE,
    season VARCHAR,
    avg_temp_c FLOAT,
    min_temp_c FLOAT,
    max_temp_c FLOAT,
    precipitation_mm FLOAT,
    snow_depth_mm FLOAT,
    avg_wind_dir_deg FLOAT,
    avg_wind_speed_kmh FLOAT,
    peak_wind_gust_kmh FLOAT,
    avg_sea_level_pres_hpa FLOAT,
    sunshine_total_min FLOAT,
    PRIMARY KEY (station_id, date)
);