import json
from fastapi import APIRouter, Depends
from sqlalchemy import or_
from sqlalchemy.orm import Session
from db.db import get_db
from db.redis_db import redis_client
from db.middlewares.auth_middleware import get_current_user
from db.models.video import ProcessingStatus, Video, VisibilityStatus


router = APIRouter()


@router.get("/all")
def get_all_videos(
    db: Session = Depends(get_db),
    user=Depends(get_current_user),
):
    videos = (
        db.query(Video)
        .filter(
            Video.is_processing == ProcessingStatus.COMPLETED,
            Video.visibility == VisibilityStatus.PUBLIC,
        )
        .all()
    )

    return videos


@router.get("/")
def get_video_info(
    video_id: str,
    db: Session = Depends(get_db),
    user=Depends(get_current_user),
):
    cache_key = f"video:{video_id}"
    cached_data = redis_client.get(cache_key)

    if cached_data:
        return json.loads(cached_data)

    video = (
        db.query(Video)
        .filter(
            Video.id == video_id,
            Video.is_processing == ProcessingStatus.COMPLETED,
            or_(
                Video.visibility == VisibilityStatus.PUBLIC,
                Video.visibility == VisibilityStatus.UNLISTED,
            ),
        )
        .first()
    )

    redis_client.set(cache_key, json.dumps(video.to_dict()), ex=600)

    return video
