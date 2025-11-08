from fastapi import APIRouter, Depends
from sqlalchemy import or_
from sqlalchemy.orm import Session
from db.db import get_db
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
    print(video_id)
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

    return video
