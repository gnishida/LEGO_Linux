#pragma once

#include <vector>
#include <opencv2/opencv.hpp>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Partition_traits_2.h>
#include <CGAL/partition_2.h>
#include <CGAL/point_generators_2.h>
#include <CGAL/random_polygon_2.h>
#include <CGAL/Polygon_2.h>
#include <CGAL/create_offset_polygons_2.h>
#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Triangulation_face_base_with_info_2.h>
#include <CGAL/Polygon_2.h>
#include <CGAL/random_polygon_2.h>
#include <CGAL/Polygon_2.h>
#include "Building.h"

namespace lego {

	namespace ply {

		// The following definitions are for triangulation only.
		struct FaceInfo {
			FaceInfo() {}
			int nesting_level;
			bool in_domain(){
				return nesting_level % 2 == 1;
			}
		};

		typedef CGAL::Exact_predicates_inexact_constructions_kernel       K;
		typedef CGAL::Triangulation_vertex_base_2<K>                      Vb;
		typedef CGAL::Triangulation_face_base_with_info_2<FaceInfo, K>    Fbb;
		typedef CGAL::Constrained_triangulation_face_base_2<K, Fbb>        Fb;
		typedef CGAL::Triangulation_data_structure_2<Vb, Fb>               TDS;
		typedef CGAL::Exact_predicates_tag                                Itag;
		typedef CGAL::Constrained_Delaunay_triangulation_2<K, TDS, Itag>  CDT;
		typedef CDT::Point                                                Point;
		typedef CGAL::Partition_traits_2<K>                         Traits;
		typedef Traits::Polygon_2                                   Polygon_2;
		typedef Traits::Point_2                                     Point_2;
		typedef Polygon_2::Vertex_iterator                          Vertex_iterator;
		typedef std::list<Polygon_2>                                Polygon_list;
		typedef CGAL::Creator_uniform_2<int, Point_2>               Creator;
		typedef CGAL::Random_points_in_square_2< Point_2, Creator > Point_generator;
		typedef boost::shared_ptr<Polygon_2>						PolygonPtr;

		void write(char* filename, const std::vector<Building>& buildings);
		
		std::vector<std::vector<cv::Point2f>> tessellate(const std::vector<cv::Point2f>& points, const std::vector<std::vector<cv::Point2f>>& holes);
		void mark_domains(CDT& ct, CDT::Face_handle start, int index, std::list<CDT::Edge>& border);
		void mark_domains(CDT& cdt);

	}
}