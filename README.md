# Music API

A Rails API for managing Music Albums, Artists, Genres, and Rankings.
This repo is the backend API. I have also provided an accompanying [Vue.js repo to consume the API](https://github.com/davewoodall/afterburners-vue).

Both repos are available locally and live.

## Live Endpoints include

- API This repo and live: http://afterburners.fakefarm.com
- SPA [Repo](https://github.com/davewoodall/afterburners-vue) amd live: http://music.fakefarm.com

## API Setup

If you wish to run locally, follow these steps. T

```
git clone
bundle install
rails db:create db:migrate db:seed
rails s
```

## Run the specs

There are request and unit specs which can be run with

```
bundle exec rspec
```

Which runs;

```
47 examples, 0 failures
```

## Resources

There are three resources: Albums, Artists, Ranks

### Albums

ALBUMS is a full CRUD resource to view all and single albums. Albums can also be created, updated, and deleted.

#### curl create new album

_local_

```
curl -X POST localhost:3000/v1/albums \
-d "[album][name]=Tarantula&[album][year]=1995&[album][genre_attributes][name]=rock&[album][artist_attributes][name]=Ride"
```

_live_

```
curl -X POST afterburners.fakefarm.com/v1/albums \
-d "[album][name]=Tarantula&[album][year]=1995&[album][genre_attributes][name]=rock&[album][artist_attributes][name]=Ride"
```

#### curl view all albums

_local_

```
curl localhost:3000/v1/albums
```

_live_

```
curl afterburners.fakefarm.com/v1/albums
```

#### curl view single albums

_local_

```
curl localhost:3000/v1/albums/:id
```

_live_

```
curl afterburners.fakefarm.com/v1/albums/:id
```

#### curl edit album

_local_

```
curl -X PATCH localhost:3000/v1/albums/:id \
-d "[album][name]=New Album Name"
```

_live_

```
curl -X PATCH afterburners.fakefarm.com/v1/albums/:id \
-d "[album][name]=New Album Name"
```

#### curl delete album

_local_

```
curl -X DELETE localhost:3000/v1/albums/:id
```

_live_

```
curl -X DELETE afterburners.fakefarm.com/v1/albums/:id
```

### Artists

ARTISTS are simply a GET of all and single resources

#### curl view all artists

_local_

```
curl localhost:3000/v1/artists
```

_live_

```
curl afterburners.fakefarm.com/v1/artists
```

#### curl view single artists

_local_

```
curl localhost:3000/v1/artists/:id
```

_live_

```
curl afterburners.fakefarm.com/v1/artists/:id
```

### Ranks

RANKS are simply a GET of Album resources based on Year and Genre.
The SPA consumes the RANKS endpoint live on the SPA: http://music.fakefarm.com

#### Year ASC order

_local_

```
curl localhost:3000/v1/ranks/year?order=asc
```

_live_

```
curl afterburners.fakefarm.com/v1/ranks/year?order=asc
```

#### Year DESC order

_local_

```
curl localhost:3000/v1/ranks/year
```

_live_

```
curl afterburners.fakefarm.com/v1/ranks/year
```

#### Genre ASC order

_local_

```
curl localhost:3000/v1/ranks/genre?order=asc
```

_live_

```
curl afterburners.fakefarm.com/v1/ranks/genre?order=asc
```

#### Genre DESC order

_local_

```
curl localhost:3000/v1/ranks/genre
```

_live_

```
curl afterburners.fakefarm.com/v1/ranks/genre
```
