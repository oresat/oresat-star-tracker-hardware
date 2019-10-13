#ifndef BEAST_H
#define BEAST_H

#include "constellations.h"
#include <stdio.h>
#include <float.h>

struct  match_result {
//TODO: private:
	constellation_pair match;
	float P11,P12,P13;
	float P21,P22,P23;
	float P31,P32,P33;
	//eci to body (body=R*eci)
	float R11,R12,R13;
	float R21,R22,R23;
	float R31,R32,R33;
	float q0,q1,q2,q3;
	float loss;
private:
	star_fov *img_mask;
	int *map; /* Usage: map[imgstar]=dbstar */
	size_t map_size;
	constellation* db_const;
	constellation_db *db,*img;
public:
	
	/**
	* @brief TODO
	* @param db_
	* @param img_
	* @param img_mask_
	*/
	match_result(constellation_db *db_, constellation_db *img_, star_fov *img_mask_) {
		DBG_MATCH_RESULT_COUNT++;
		DBG_PRINT("DBG_MATCH_RESULT_COUNT++ %d\n",DBG_MATCH_RESULT_COUNT);
		db=db_;
		img=img_;
		img_mask=img_mask_;
		map_size=img->stars->size();
		map=(int *)malloc(sizeof(map[0])*map_size);
		match.totalscore=-FLT_MAX;
		
	}
	~match_result() {
		DBG_MATCH_RESULT_COUNT--;
		DBG_PRINT("DBG_MATCH_RESULT_COUNT-- %d\n",DBG_MATCH_RESULT_COUNT);
		free(map);
	}
	size_t size() {return map_size;};
	/**
	* @brief TODO
	* @param db_const_
	* @param img_const_
	*/
	void init(constellation &db_const_, constellation &img_const_) {
		db_const=&db_const_;
		
		match.img_s1=img_const_.s1;
		match.img_s2=img_const_.s2;
		match.db_s1=db_const_.s1;
		match.db_s2=db_const_.s2;
	}
	
	/**
	* @brief TODO
	* @param c
	*/
	void copy_over(match_result *c) {
		assert(c->db==db);
		assert(c->img==img);
		assert(c->img_mask==img_mask);
		
		c->match=match;
		c->db_const=db_const;
		
		c->R11=R11,c->R12=R12,c->R13=R13;
		c->R21=R21,c->R22=R22,c->R23=R23;
		c->R31=R31,c->R32=R32,c->R33=R33;
		
		memcpy(c->map, map, sizeof(map[0])*map_size);
	}
	/**
	* @brief TODO
	* @param m
	* @return 
	*/
	int related(constellation_pair &m) {
		
		if (match.totalscore==-FLT_MAX || m.totalscore==-FLT_MAX) return 0;
		return (map[m.img_s1]==m.db_s1 && map[m.img_s2]==m.db_s2)?1:0;
	}
	/**
	* @brief TODO
	*/
	void search() {if (db->results->is_kdsorted()) db->results->kdsearch(R11,R21,R31,MAXFOV/2,THRESH_FACTOR*IMAGE_VARIANCE);}
	/**
	* @brief TODO
	*/
	void clear_search() {if (db->results->is_kdsorted()) db->results->clear_kdresults();}
	/**
	* @brief TODO
	*/
	void compute_score() {
		//TODO: figure out where 2*map_size came from
		match.totalscore=log(1.0/(IMG_X*IMG_Y))*(2*map_size);
		float* scores=(float *)malloc(sizeof(float)*map_size);
		for (size_t i=0;i<map_size;i++) {
			map[i]=-1;
			scores[i]=0.0;
		}
		for(size_t i=0;i<db->results->r_size();i++) {
			star *s=&(db->results->map[db->results->kdresults[i]]);
			int o=s->star_idx;
			float x=s->x*R11+s->y*R21+s->z*R31;
			float y=s->x*R12+s->y*R22+s->z*R32;
			float z=s->x*R13+s->y*R23+s->z*R33;
			float px=y/(x*PIXX_TANGENT);
			float py=z/(x*PIXY_TANGENT);
			
			int n=img_mask->get_id(px,py);
			if (n>=0) {
				float score = img_mask->get_score(n,px,py);
				if (score>scores[n]){/* only match the closest star */
					map[n]=o;
					scores[n]=score;
				}
			}
		}
		for(size_t n=0;n<map_size;n++) {
			match.totalscore+=scores[n];
		}
		free(scores);
	}
	/**
	* @return matching stars from db, in order of star_idx
	*/
	star_db* from_match() {
		if (match.totalscore==-FLT_MAX) return NULL;
		
		star_db* s = img->stars->copy();
		s->max_variance=db->stars->max_variance;
		for(size_t n=0;n<map_size;n++) {
			//catalog matching
			if (map[n]!=-1) {
				s->get_star(img->stars->get_star(n)->star_idx)[0]=db->stars->get_star(map[n])[0];
			} else {
				s->get_star(img->stars->get_star(n)->star_idx)->id=-1;
			}
		}
		return s;
	}
	/**
	* @brief fast quaternion results
	* see Fundamentals of Spacecraft Attitude Determination and Control 
	* and doi: 10.2514/2.4897
	* 
	* this is technically suboptimal, it's fairly trivial to upgrade to the optimal version
	* but this is a marginal improvement that is less computationally efficient
	*/
	void fast_quaternion() {
		star *db_s1=db->stars->get_star(match.db_s1);
		star *db_s2=db->stars->get_star(match.db_s2);
		star *img_s1=img->stars->get_star(match.img_s1);
		star *img_s2=img->stars->get_star(match.img_s2);
		
		/* b=A*r */
		float ra1=db_s1->x,ra2=db_s1->y,ra3=db_s1->z;
		float rb1=db_s2->x,rb2=db_s2->y,rb3=db_s2->z;
		float ba1=img_s1->x,ba2=img_s1->y,ba3=img_s1->z;
		float bb1=img_s2->x,bb2=img_s2->y,bb3=img_s2->z;

		float prod1=ba1*ra1;
		float prod2=ba2*ra2;
		float prod3=ba3*ra3;
		float dot=prod1+prod2+prod3;

		int rotate=0;
		if((dot<prod1) && (dot<prod2) && (dot<prod2)) {
			//float axis;
			float ek1,ek2,ek3;
			rotate=1
			if(prod1<prod2) {
				if(prod2<prod3) {
					//axis=3;
					ra1*=-1;
					ra2*=-1;
					rb1*=-1;
					rb2*=-1;
					ek1=0;
					ek2=0;
					ek3=1;
				} else {
					//axis=2;
					ra1*=-1;
					ra3*=-1;
					rb1*=-1;
					rb3*=-1;
					ek1=0;
					ek2=1;
					ek3=0;
				}
			} else if(prod1<prod3) {
				//axis=3;
				ra1*=-1;
				ra2*=-1;
				rb1*=-1;
				rb2*=-1;
				ek1=0;
				ek2=0;
				ek3=1;
			} else {
				//axis=1;
				ra3*=-1;
				ra2*=-1;
				rb3*=-1;
				rb2*=-1;
				ek1=1;
				ek2=0;
				ek3=0;
			}
			float E11,E12,E13,E14;
			float E21,E22,E23,E24;
			float E31,E32,E33,E34;
			float E41,E42,E43,E44;
			E11=0;
			E12=-ek3;
			E13=ek2;
			E14=ek1;
			E21=ek3;
			E22=0;
			E23=-ek1;
			E24=ek2;
			E31=-ek2;
			E32=ek1;
			E33=0;
			E34=ek3;
			E41=-ek1;
			E42=-ek2;
			E43=-ek3;
			E44=0;
			dot=ba1*ra1+ba2*ra2+ba3*ra3;
		}

		float bc1=ba2*bb3 - ba3*bb2;
		float bc2=ba3*bb1 - ba1*bb3;
		float bc3=ba1*bb2 - ba2*bb1;

		float rc1=ra2*rb3 - ra3*rb2;
		float rc2=ra3*rb1 - ra1*rb3;
		float rc3=ra1*rb2 - ra2*rb1;

		dot+=1
		float mu=dot*(bc1*rc1+bc2*rc2+bc3*rc3);
		mu -= (ba1*rc1+ba2*rc2+ba3*rc3)*(bc1*ra1+bc2*ra2+bc3*ra3);

		float t1=bc2*rc3 - bc3*rc2;
		float t2=bc3*rc1 - bc1*rc3;
		float t3=bc1*rc2 - bc2*rc1;

		float sum1=ba1+ra1;
		float sum2=ba2+ra2;
		float sum3=ba3+ra3;

		float nu=sum1*t1 + sum2*t2 + sum3*t3;
		float rho=sqrt(mu*mu + nu*nu);
		float bot, comb;

		float cross1=ba2*ra3 - ba3*ra2;
		float cross2=ba3*ra1 - ba1*ra3;
		float cross3=ba1*ra2 - ba2*ra1;

		if(mu>=0) {
			comb=rho+mu;
			q0=comb*dot;
			q1=comb*cross1 + nu*sum1;
			q2=comb*cross2 + nu*sum2;
			q3=comb*cross3 + nu*sum3;
		} else {
			comb=rho-mu;
			q0=nu*dot;
			q1=nu*cross1 + comb*sum1;
			q2=nu*cross2 + comb*sum2;
			q3=nu*cross3 + comb*sum3;
		}

		bot=2*sqrt(rho*comb*dot);
		q0/=bot;
		q1/=bot;
		q2/=bot;
		q3/=bot;

		if(rotate==1) {
			float k0,k1,k2,k3;
			k0=q0;
			k1=q1;
			k2=q2;
			k3=q3;
			q0=E11*k0 + E12*k1 + E13*k2 + E14*k3;
			q1=E21*k0 + E22*k1 + E23*k2 + E24*k3;
			q2=E31*k0 + E32*k1 + E33*k2 + E34*k3;
			q3=E41*k0 + E42*k1 + E43*k2 + E44*k3;
		}

		float sig1=db_s1->sigma_sq+img_s1->sigma_sq;
		float sig2=db_s2->sigma_sq+img_s2->sigma_sq;
		float c=1.0;
		float a2= c / sig2;

		loss=a2*(1-(ba1*bb1+ba2*bb2+ba3*bb3)*(ra1*rb1+ra2*rb2+ra3*rb3)-(rho/dot));

		float bcnorm=sqrt(bc1*bc1+bc2*bc2+bc3*bc3);
		float bs11, bs12, bs13;
		float bs21, bs22, bs23;
		float bs31, bs32, bs33;
		float bottom=bcnorm*bcnorm;
		bs11=(sig2*ba1*ba1 + sig1*bb1*bb1)/bottom;
		bs12=(sig2*ba1*ba2 + sig1*bb1*bb2)/bottom;
		bs13=(sig2*ba1*ba3 + sig1*bb1*bb3)/bottom;
		bs21=(sig2*ba2*ba1 + sig1*bb2*bb1)/bottom;
		bs22=(sig2*ba2*ba2 + sig1*bb2*bb2)/bottom;
		bs23=(sig2*ba2*ba3 + sig1*bb2*bb3)/bottom;
		bs31=(sig2*ba3*ba1 + sig1*bb3*bb1)/bottom;
		bs32=(sig2*ba3*ba2 + sig1*bb3*bb2)/bottom;
		bs33=(sig2*ba3*ba3 + sig1*bb3*bb3)/bottom;
		
		float bx11, bx12, bx13;
		float bx21, bx22, bx23;
		float bx31, bx32, bx33;
		float sigs=(sig1*sig2)/(sig1+sig2);
		bx11=sigs*bc1*bc1;
		bx12=sigs*bc1*bc2;
		bx13=sigs*bc1*bc3;
		bx21=sigs*bc2*bc1;
		bx22=sigs*bc2*bc2;
		bx23=sigs*bc2*bc3;
		bx31=sigs*bc3*bc1;
		bx32=sigs*bc3*bc2;
		bx33=sigs*bc3*bc3;

		P11=bs11+bx11;
		P12=bs12+bx12;
		P13=bs13+bx13;
		P21=bs21+bx21;
		P22=bs22+bx22;
		P23=bs23+bx23;
		P31=bs31+bx31;
		P32=bs32+bx32;
		P33=bs33+bx33;
	}
	/**
	* @brief weighted_triad results
	* see https://en.wikipedia.org/wiki/Triad_method 
	* and http://nghiaho.com/?page_id=846
	* 
	* when compiled, this section contains roughly 430 floating point operations
	* according to https://www.karlrupp.net/2016/02/gemm-and-stream-results-on-intel-edison
	* we can perform >250 MFLOPS with doubles, and >500 MFLOPS with floats
	*/
	void weighted_triad() {
		star *db_s1=db->stars->get_star(match.db_s1);
		star *db_s2=db->stars->get_star(match.db_s2);
		star *img_s1=img->stars->get_star(match.img_s1);
		star *img_s2=img->stars->get_star(match.img_s2);
		
		/* v=A*w */
		float wa1=db_s1->x,wa2=db_s1->y,wa3=db_s1->z;
		float wb1=db_s2->x,wb2=db_s2->y,wb3=db_s2->z;
		float va1=img_s1->x,va2=img_s1->y,va3=img_s1->z;
		float vb1=img_s2->x,vb2=img_s2->y,vb3=img_s2->z;
		float wc1=wa2*wb3 - wa3*wb2;
		float wc2=wa3*wb1 - wa1*wb3;
		float wc3=wa1*wb2 - wa2*wb1;
		float wcnorm=sqrt(wc1*wc1+wc2*wc2+wc3*wc3);
		wc1/=wcnorm;
		wc2/=wcnorm;
		wc3/=wcnorm;

		float vc1=va2*vb3 - va3*vb2;
		float vc2=va3*vb1 - va1*vb3;
		float vc3=va1*vb2 - va2*vb1;
		float vcnorm=sqrt(vc1*vc1+vc2*vc2+vc3*vc3);
		vc1/=vcnorm;
		vc2/=vcnorm;
		vc3/=vcnorm;

		float vaXvc1=va2*vc3 - va3*vc2;
		float vaXvc2=va3*vc1 - va1*vc3;
		float vaXvc3=va1*vc2 - va2*vc1;

		float waXwc1=wa2*wc3 - wa3*wc2;
		float waXwc2=wa3*wc1 - wa1*wc3;
		float waXwc3=wa1*wc2 - wa2*wc1;
		
		/* some of these are unused */
		float A11=va1*wa1 + vaXvc1*waXwc1 + vc1*wc1;
		/* float A12=va1*wa2 + vaXvc1*waXwc2 + vc1*wc2; */
		/* float A13=va1*wa3 + vaXvc1*waXwc3 + vc1*wc3; */
		float A21=va2*wa1 + vaXvc2*waXwc1 + vc2*wc1;
		/* float A22=va2*wa2 + vaXvc2*waXwc2 + vc2*wc2; */
		/* float A23=va2*wa3 + vaXvc2*waXwc3 + vc2*wc3; */
		float A31=va3*wa1 + vaXvc3*waXwc1 + vc3*wc1;
		float A32=va3*wa2 + vaXvc3*waXwc2 + vc3*wc2;
		float A33=va3*wa3 + vaXvc3*waXwc3 + vc3*wc3;
		
		wc1=-wc1;
		wc2=-wc2;
		wc3=-wc3;
		
		vc1=-vc1;
		vc2=-vc2;
		vc3=-vc3;
		float vbXvc1=vb2*vc3 - vb3*vc2;
		float vbXvc2=vb3*vc1 - vb1*vc3;
		float vbXvc3=vb1*vc2 - vb2*vc1;
		
		float wbXwc1=wb2*wc3 - wb3*wc2;
		float wbXwc2=wb3*wc1 - wb1*wc3;
		float wbXwc3=wb1*wc2 - wb2*wc1;

		/* some of these are unused */
		float B11=vb1*wb1 + vbXvc1*wbXwc1 + vc1*wc1;
		/* float B12=vb1*wb2 + vbXvc1*wbXwc2 + vc1*wc2; */
		/* float B13=vb1*wb3 + vbXvc1*wbXwc3 + vc1*wc3; */
		float B21=vb2*wb1 + vbXvc2*wbXwc1 + vc2*wc1;
		/* float B22=vb2*wb2 + vbXvc2*wbXwc2 + vc2*wc2; */
		/* float B23=vb2*wb3 + vbXvc2*wbXwc3 + vc2*wc3; */
		float B31=vb3*wb1 + vbXvc3*wbXwc1 + vc3*wc1;
		float B32=vb3*wb2 + vbXvc3*wbXwc2 + vc3*wc2;
		float B33=vb3*wb3 + vbXvc3*wbXwc3 + vc3*wc3;
		
		/* use weights based on magnitude */
		/* weighted triad */
		float sig1=db_s1->sigma_sq+img_s1->sigma_sq;
		float sig2=db_s2->sigma_sq+img_s2->sigma_sq;
		float weightA=1.0/sig1;
		float weightB=1.0/sig2;

		float sumAB=weightA+weightB;
		weightA/=sumAB;
		weightB/=sumAB;
		
		float cz,sz,mz;
		float cy,sy,my;
		float cx,sx,mx;
		
		cz=weightA*A11+weightB*B11;
		sz=weightA*A21+weightB*B21;
		mz=sqrt(cz*cz+sz*sz);
		cz=cz/mz;
		sz=sz/mz;
		
		cy=weightA*sqrt(A32*A32+A33*A33)+weightB*sqrt(B32*B32+B33*B33);
		sy=-weightA*A31-weightB*B31;
		my=sqrt(cy*cy+sy*sy);
		cy=cy/my;
		sy=sy/my;
		
		cx=weightA*A33+weightB*B33;
		sx=weightA*A32+weightB*B32;
		mx=sqrt(cx*cx+sx*sx);
		cx=cx/mx;
		sx=sx/mx;
		
		R11=cy*cz;
		R21=cz*sx*sy - cx*sz;
		R31=sx*sz + cx*cz*sy;
		
		R12=cy*sz;
		R22=cx*cz + sx*sy*sz;
		R32=cx*sy*sz - cz*sx;
		
		R13=-sy;
		R23=cy*sx;
		R33=cx*cy;
		
		float bs11, bs12, bs13;
		float bs21, bs22, bs23;
		float bs31, bs32, bs33;
		float bottom=vcnorm*vcnorm;
		bs11=(sig2*va1*va1 + sig1*vb1*vb1)/bottom;
		bs12=(sig2*va1*va2 + sig1*vb1*vb2)/bottom;
		bs13=(sig2*va1*va3 + sig1*vb1*vb3)/bottom;
		bs21=(sig2*va2*va1 + sig1*vb2*vb1)/bottom;
		bs22=(sig2*va2*va2 + sig1*vb2*vb2)/bottom;
		bs23=(sig2*va2*va3 + sig1*vb2*vb3)/bottom;
		bs31=(sig2*va3*va1 + sig1*vb3*vb1)/bottom;
		bs32=(sig2*va3*va2 + sig1*vb3*vb2)/bottom;
		bs33=(sig2*va3*va3 + sig1*vb3*vb3)/bottom;
		
		float bx11, bx12, bx13;
		float bx21, bx22, bx23;
		float bx31, bx32, bx33;
		float sigs=(sig1*sig2)/(sig1+sig2);
		bx11=sigs*vc1*vc1;
		bx12=sigs*vc1*vc2;
		bx13=sigs*vc1*vc3;
		bx21=sigs*vc2*vc1;
		bx22=sigs*vc2*vc2;
		bx23=sigs*vc2*vc3;
		bx31=sigs*vc3*vc1;
		bx32=sigs*vc3*vc2;
		bx33=sigs*vc3*vc3;

		P11=bs11+bx11;
		P12=bs12+bx12;
		P13=bs13+bx13;
		P21=bs21+bx21;
		P22=bs22+bx22;
		P23=bs23+bx23;
		P31=bs31+bx31;
		P32=bs32+bx32;
		P33=bs33+bx33;
	}
	void DBG_(const char *s) {
		DBG_PRINT("%s\n",s);
		DBG_PRINT("%f\t%f\t%f\n", R11,R12,R13);
		DBG_PRINT("%f\t%f\t%f\n", R21,R22,R23);
		DBG_PRINT("%f\t%f\t%f\n", R31,R32,R33);
		
		db->DBG_("DB");
		img->DBG_("IMG");
		DBG_PRINT("map_size=%lu\n", map_size);
		for (size_t i=0; i<map_size; i++) {
			DBG_PRINT("map[%lu]=%d\n",i,map[i]);
		}
	}
	/**
	* @brief TODO
	*/
	void print_ori() {
		double dec = fmod(360 + asin(R31) * 180 / PI, 360);
		double ra = fmod(360 + atan2(R21, R11) * 180 / PI, 360);
		double ori = -atan2(R32, R33) * 180 / PI;

		fprintf(stderr, "\nDEC=%f\n", dec);
		fprintf(stderr, "RA=%f\n", ra);
		fprintf(stderr, "ORIENTATION=%f\n", ori);

		FILE * fp = fopen("./last_results.txt", "w");
		if (fp == NULL) return;
		fprintf(fp, "DEC=%f\n", dec);
		fprintf(fp, "RA=%f\n", ra);
		fprintf(fp, "ORIENTATION=%f", ori);
		fclose(fp);
	}
};

struct db_match {
private:
	constellation_pair *c_pairs;
	size_t c_pairs_size;
	star_fov *img_mask;
public:
	float p_match;
	match_result *winner;
	
		
	/**
	* @brief TODO
	* @param db
	* @param img
	*/
	db_match(constellation_db *db, constellation_db *img) {
		DBG_DB_MATCH_COUNT++;
		DBG_PRINT("DBG_DB_MATCH_COUNT++ %d\n",DBG_DB_MATCH_COUNT);
		winner=NULL;
		img_mask=NULL;
		c_pairs=NULL;
		c_pairs_size=0;
		p_match=0.0;
//TODO - set size to 4 in python
		if (db->stars->size()<3||img->stars->size()<3) return;
		img_mask = new star_fov(img->stars,db->stars->max_variance);
		
		//find stars
		match_result *m=new match_result(db, img, img_mask);
		winner=new match_result(db, img, img_mask);
		for (size_t n=0;n<img->map_size;n++) {
			constellation lb=img->map[n];
			constellation ub=img->map[n];
			lb.p-=POS_ERR_SIGMA*PIXSCALE*sqrt(img->stars->get_star(lb.s1)->sigma_sq+img->stars->get_star(lb.s2)->sigma_sq+2*db->stars->max_variance);
			ub.p+=POS_ERR_SIGMA*PIXSCALE*sqrt(img->stars->get_star(ub.s1)->sigma_sq+img->stars->get_star(ub.s2)->sigma_sq+2*db->stars->max_variance);
			constellation *lower=std::lower_bound (db->map, db->map+db->map_size, lb,constellation_lt_p);	
			constellation *upper=std::upper_bound (db->map, db->map+db->map_size, ub,constellation_lt_p);
			//rewind upper & do sanity checks
			if (db->map>=upper--) continue;
			if (db->map+db->map_size<=lower) continue;
			if (lower->idx<=upper->idx) {
				c_pairs=(struct constellation_pair*)realloc(c_pairs,sizeof(struct constellation_pair)*(c_pairs_size+(upper->idx-lower->idx+1)*2));
			}
			for (int o=lower->idx;o<=upper->idx;o++) {
				m->init(db->map[o],img->map[n]);
				m->weighted_triad();
				m->search();

				#define ADD_SCORE\
					m->compute_score();\
					if (m->match.totalscore>winner->match.totalscore) {\
						if (winner->match.totalscore!=-FLT_MAX) c_pairs[c_pairs_size++]=winner->match;\
						m->copy_over(winner);\
					} else c_pairs[c_pairs_size++]=m->match;

				ADD_SCORE
				/* try both orderings of stars */
				m->match.flip();
				m->weighted_triad();
				ADD_SCORE
				m->clear_search();
			}
		}
		delete m;
		
		//calculate map
		if (winner->match.totalscore!=-FLT_MAX) { //Did we even match?
			//calculate p_match
			p_match=1.0;
			for (size_t idx=0; idx<c_pairs_size;idx++) {
				if (!winner->related(c_pairs[idx])){
					p_match+=exp(c_pairs[idx].totalscore-winner->match.totalscore);
				}
			}
			p_match=1.0/p_match;
		}
	}
	
	~db_match() {
		DBG_DB_MATCH_COUNT--;
		DBG_PRINT("DBG_DB_MATCH_COUNT-- %d\n",DBG_DB_MATCH_COUNT);
		delete winner;
		delete img_mask;
		free(c_pairs);
	}
};
#endif
